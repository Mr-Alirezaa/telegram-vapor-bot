#if compiler(>=5.5) && canImport(_Concurrency)
    import Foundation

    public class AsyncCallbackQueryHandler<ResultType>: BaseCallbackQueryHandler, AsyncHandler {
        public typealias CallbackType = (_ update: Update, _ bot: BotProtocol) async throws -> ResultType

        public var id = 0

        public var name: String
        public let callback: CallbackType

        public let pattern: String

        public init(
            name: String = String(describing: CallbackQueryHandler<ResultType>.self),
            pattern: String,
            _ callback: @escaping CallbackType
        ) {
            self.name = name
            self.pattern = pattern
            self.callback = callback
        }

        public func handle(update: Update, bot: BotProtocol) async throws -> ResultType {
            try await callback(update, bot)
        }
    }
#endif
