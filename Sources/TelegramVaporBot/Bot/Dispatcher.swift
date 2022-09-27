import Foundation
import Vapor

public protocol DispatcherProtocol {
    var bot: Bot? { get set }
    var handlersGroup: [[HandlerProtocol]] { get set }

    /// The higher level has the highest priority
    func add(_ handler: HandlerProtocol, priority: Int)
    func add(_ handler: HandlerProtocol)
    func addBeforeAllCallback(_ callback: @escaping ([Update], @escaping ([Update]) throws -> Void) throws -> Void)
    func remove(_ handler: HandlerProtocol, from level: Int?)
    func process(_ updates: [Update]) throws
}

open class DefaultDispatcher: DispatcherProtocol {
    public weak var bot: Bot?
    private var processQueue: DispatchQueue = .init(
        label: "com.telegram-vapor-bot-lib.dispatcher.processQueue",
        qos: .default,
        attributes: .concurrent
    )

    private var handlerQueue: DispatchQueue = .init(
        label: "com.telegram-vapor-bot-lib.dispatcher.handlerQueue",
        qos: .default,
        attributes: .concurrent
    )

    public var handlersGroup: [[HandlerProtocol]] = []
    private var beforeAllCallback: ([Update], @escaping ([Update]) throws -> Void) throws -> Void = { updates, callback in
        try callback(updates)
    }

    private var handlersId = 0
    private var nextHandlerId: Int {
        handlersId += 1
        return handlersId
    }

    private var index = 0

    private typealias Level = Int
    private typealias IndexId = Int
    private typealias Position = Int
    private var handlersIndex: [Level: [IndexId: Position]] = .init()

    public init() {}

    public func add(_ handler: HandlerProtocol, priority level: Int) {
        processQueue.sync(flags: .barrier) { [weak self] in
            guard let self = self else { return }

            /// add uniq index id
            var handler: HandlerProtocol = handler
            handler.id = self.nextHandlerId

            /// add handler
            var handlerPosition = 0
            let correctLevel: Int = level >= 0 ? level : 0
            if self.handlersGroup.count > correctLevel {
                self.handlersGroup[correctLevel].append(handler)
                handlerPosition = self.handlersGroup[correctLevel].count - 1
            } else {
                self.handlersGroup.append([handler])
                handlerPosition = self.handlersGroup[self.handlersGroup.count - 1].count - 1
            }

            /// add handler to index
            if self.handlersIndex[level] == nil { self.handlersIndex[level] = .init() }
            self.handlersIndex[level]?[handler.id] = handlerPosition
        }
    }

    public func add(_ handler: HandlerProtocol) {
        add(handler, priority: 0)
    }

    public func addBeforeAllCallback(_ callback: @escaping ([Update], @escaping ([Update]) throws -> Void) throws -> Void) {
        beforeAllCallback = callback
    }

    public func remove(_ handler: HandlerProtocol, from level: Int?) {
        processQueue.sync(flags: .barrier) { [weak self] in
            guard let self = self else { return }
            let level: Level = level ?? 0
            let indexId: IndexId = handler.id
            guard
                let index: [IndexId: Position] = self.handlersIndex[level],
                let position: Position = index[indexId]
            else {
                return
            }
            self.handlersGroup[level].remove(at: position)
            self.handlersIndex[level]![indexId] = nil
        }
    }

    public func process(_ updates: [Update]) throws {
        processQueue.async { [weak self] in
            guard let self = self else {
                Bot.log.error("Dispatcher was deinited")
                return
            }
            do {
                try self.beforeAllCallback(updates) { updates in
                    for update in updates {
                        try self.processByHandler(update)
                    }
                }
            } catch {
                Bot.log.critical("Dispatcher process: \(error.logMessage)")
            }
        }
    }

    func processByHandler(_ update: Update) throws {
        processQueue.async { [weak self] in
            guard let self = self, let bot = self.bot, self.handlersGroup.count > 0 else {
                if self == nil { Bot.log.error("Dispatcher was deinited"); return }
                if self?.bot == nil { Bot.log.error("Bot not set to dispatcher"); return }
                return
            }
            for i in 1 ... self.handlersGroup.count {
                for handler in self.handlersGroup[self.handlersGroup.count - i] {
                    if handler.check(update: update) {
                        self.handlerQueue.async {
                            handler.handle(update: update, bot: bot)
                        }
                    }
                }
            }
        }
    }
}
