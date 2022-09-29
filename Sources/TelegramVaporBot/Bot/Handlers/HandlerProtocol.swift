import Foundation

public typealias HandlerCallback = (_ update: Update, _ bot: BotProtocol) throws -> Void

public protocol HandlerProtocol {
    var id: Int { get set }
    var name: String { get }
    var callback: HandlerCallback { get }

    func check(update: Update) -> Bool
    func handle(update: Update, bot: BotProtocol)
}

public extension HandlerProtocol {
    func handle(update: Update, bot: BotProtocol) {
        do {
            try callback(update, bot)
        } catch {
            Bot.log.error(error.logMessage)
        }
    }
}

public extension HandlerProtocol {
    var name: String {
        String(describing: Self.self)
    }
}
