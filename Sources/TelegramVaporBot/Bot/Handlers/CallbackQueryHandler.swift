import Foundation

/// Handler for CallbackQuery updates
public class CallbackQueryHandler: HandlerProtocol {
    public var id = 0

    public var name: String

    let pattern: String
    let callback: HandlerCallback

    public init(
        name: String = String(describing: CallbackQueryHandler.self),
        pattern: String,
        _ callback: @escaping HandlerCallback
    ) {
        self.pattern = pattern
        self.callback = callback
        self.name = name
    }

    public func check(update: Update) -> Bool {
        guard let callbackQuery = update.callbackQuery else { return false }
        if let data = callbackQuery.data,
           !data.matchRegexp(pattern: pattern)
        {
            return false
        }
        return true
    }

    public func handle(update: Update, bot: BotProtocol) {
        do {
            try callback(update, bot)
        } catch {
            Bot.log.error(error.logMessage)
        }
    }
}
