import Foundation
import Vapor

/// Handler class to handle Telegram commands.
///
/// Commands are Telegram messages that start with /, optionally followed by an @ and the bot’s name
/// and/or some additional text.
///
/// - Options of this handler
/// - `editedUpdates` Determines whether the handler should also accept edited messages.
///
public class CommandHandler<ResultType>: BaseCommandHandler, Handler {
    public typealias CallbackType = (_ update: Update, _ bot: BotProtocol) throws -> ResultType
    public typealias Options = CommandHandlerOptions

    public var id = 0

    public var name: String

    public let callback: CallbackType

    public let commands: Set<String>
    public let filters: Filter
    public let options: Options
    public let botUsername: String?

    public init(
        name: String = String(describing: CommandHandler.self),
        commands: Set<String>,
        filters: Filter = .all,
        options: Options = [],
        botUsername: String? = nil,
        _ callback: @escaping CallbackType
    ) {
        self.name = name
        self.commands = Set(commands)
        self.filters = filters
        self.options = options
        self.botUsername = botUsername
        self.callback = callback
    }

    public func handle(update: Update, bot: BotProtocol) throws -> ResultType {
        return try callback(update, bot)
    }
}
