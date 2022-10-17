#if compiler(>=5.5) && canImport(_Concurrency)
    import Foundation

    /// Handler for bot messages, can handle normal messages, channel posts, edited messages
    public class AsyncMessageHandler<ResultType>: BaseMessageHandler, AsyncHandler {
        public typealias CallbackType = (_ update: Update, _ bot: BotProtocol) async throws -> ResultType
        public typealias Options = MessageHandlerOptions

        public var id = 0
        /// Name of particular MessageHandler, needed for determine handlers instances of one class in groups
        public var name: String

        public let callback: CallbackType
        public let filters: Filter
        public let options: Options

        public init(
            name: String = String(describing: MessageHandler<ResultType>.self),
            filters: Filter = .all,
            options: Options = [.messageUpdates, .channelPostUpdates],
            _ callback: @escaping CallbackType
        ) {
            self.filters = filters
            self.callback = callback
            self.options = options
            self.name = name
        }

        public func handle(update: Update, bot: BotProtocol) async throws -> ResultType {
            try await callback(update, bot)
        }
    }
#endif
