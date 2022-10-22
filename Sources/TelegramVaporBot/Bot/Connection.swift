import Foundation
import Vapor

public protocol ConnectionProtocol {
    var bot: Bot? { get set }
    var dispatcher: DispatcherProtocol { get }

    @discardableResult func start() throws -> Bool
}

public final class LongPollingConnection: ConnectionProtocol {
    public weak var bot: Bot? {
        get { _bot }
        set {
            _bot = newValue
            dispatcher.bot = newValue
        }
    }

    public var dispatcher: DispatcherProtocol
    public var limit: Int?
    public var timeout: Int? = 15
    public var allowedUpdates: [Update.CodingKeys]?

    private weak var _bot: Bot?
    private var offsetUpdates = 0
    private var newOffsetUpdates: Int { offsetUpdates + 1 }

    public init(
        dispatcher: DispatcherProtocol,
        limit: Int? = nil,
        timeout: Int? = nil,
        allowedUpdates: [Update.CodingKeys]? = nil
    ) {
        self.dispatcher = dispatcher
        self.limit = limit
        self.timeout = timeout ?? self.timeout
        self.allowedUpdates = allowedUpdates
    }

    public init(limit: Int? = nil, timeout: Int? = nil, allowedUpdates: [Update.CodingKeys]? = nil) {
        self.dispatcher = Dispatcher()
        self.limit = limit
        self.timeout = timeout ?? self.timeout
        self.allowedUpdates = allowedUpdates
    }

    @discardableResult public func start() throws -> Bool {
        /// delete webhook because: You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.
        let deleteWebHookParams: DeleteWebhookParams = .init(dropPendingUpdates: false)
        guard let bot = bot else { return false }
        let future: EventLoopFuture<Bool> = try bot.deleteWebhook(params: deleteWebHookParams)
        var result = false
        future.whenComplete { [weak self] response in
            switch response {
            case .success:
                result = true
            case let .failure(error):
                Bot.log.critical(error.logMessage)
            }

            do {
                try self?.getUpdates()
                Bot.log.info("LongPolling Start")
            } catch {
                Bot.log.critical(error.logMessage)
            }
        }
        _ = try future.wait()

        return result
    }

    private func getUpdates() throws {
        let allowedUpdates: [String] = (allowedUpdates ?? []).map(\.rawValue)
        let params: GetUpdatesParams = .init(
            offset: newOffsetUpdates,
            limit: limit,
            timeout: timeout,
            allowedUpdates: allowedUpdates
        )
        try bot?.getUpdates(params: params).whenComplete { [weak self] response in
            switch response {
            case let .success(updates):
                if let lastUpdate: Update = updates.last {
                    self?.offsetUpdates = lastUpdate.updateID
                }
                do {
                    try self?.dispatcher.process(updates)
                } catch {
                    Bot.log.critical(error.logMessage)
                }
            case let .failure(error):
                Bot.log.critical(error.logMessage)
            }
            do {
                try self?.getUpdates()
            } catch {
                Bot.log.critical(error.logMessage)
            }
        }
    }
}

public final class WebHookConnection: ConnectionProtocol {
    private weak var _bot: Bot?
    public weak var bot: Bot? {
        get { _bot }
        set {
            _bot = newValue
            dispatcher.bot = newValue
        }
    }

    public var dispatcher: DispatcherProtocol
    public var webHookURL: URI

    public init(webHookURL: URI, dispatcher: DispatcherProtocol) {
        self.webHookURL = webHookURL
        self.dispatcher = dispatcher
    }

    public init(webHookURL: URI) {
        self.webHookURL = webHookURL
        self.dispatcher = Dispatcher()
    }

    @discardableResult public func start() throws -> Bool {
        let webHookParams: SetWebhookParams = .init(url: webHookURL.description)
        guard let bot = bot else { return false }
        let future: EventLoopFuture<Bool> = try bot.setWebhook(params: webHookParams)
        var result = false
        future.whenComplete { response in
            switch response {
            case .success:
                result = true
            case let .failure(error):
                Bot.log.critical(error.logMessage)
            }
        }
        _ = try future.wait()

        return result
    }
}
