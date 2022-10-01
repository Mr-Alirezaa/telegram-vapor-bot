#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

public class AsyncCommandHandler<ResultType>: BaseCommandHandler, AsyncHandler {
    public typealias CallbackType = (_ update: Update, _ bot: BotProtocol) async throws -> ResultType
    public typealias Options = CommandHandlerOptions

    public var id = 0

    public var name: String

    public let callback: CallbackType

    public let commands: Set<String>
    public let filters: Filter
    public let options: Options
    public let botUsername: String?

    public init(
        name: String = String(describing: CommandHandler<ResultType>.self),
        commands: Set<String>,
        filters: Filter = .all,
        options: Options = [],
        botUsername: String? = nil,
        _ callback: @escaping CallbackType
    ) {
        self.name = name
        self.commands = commands
        self.filters = filters
        self.options = options
        self.botUsername = botUsername
        self.callback = callback
    }

    public func handle(update: Update, bot: BotProtocol) async throws -> ResultType {
        return try await callback(update, bot)
    }
}
#endif
