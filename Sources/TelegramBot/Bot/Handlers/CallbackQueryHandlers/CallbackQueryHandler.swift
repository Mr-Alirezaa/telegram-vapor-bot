import Foundation

/// Handler for CallbackQuery updates
public class CallbackQueryHandler<ResultType>: BaseCallbackQueryHandler, Handler {
    public typealias CallbackType = (_ update: Update, _ bot: BotProtocol) throws -> ResultType

    public var id = 0

    public var name: String
    public let callback: CallbackType

    public let pattern: String

    public init(
        name: String = String(describing: CallbackQueryHandler.self),
        pattern: String,
        _ callback: @escaping CallbackType
    ) {
        self.pattern = pattern
        self.callback = callback
        self.name = name
    }

    public func handle(update: Update, bot: BotProtocol) throws -> ResultType {
        try callback(update, bot)
    }
}
