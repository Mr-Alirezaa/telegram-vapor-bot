#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

/// Handler for bot messages, can handle normal messages, channel posts, edited messages
public class AsyncMessageHandler: MessageHandler, AsyncHandlerProtocol {
    public let asyncCallback: AsyncHandlerCallback

    public init(
        name: String = String(describing: MessageHandler.self),
        filters: Filter = .all,
        options: Options = [.messageUpdates, .channelPostUpdates],
        _ callback: @escaping AsyncHandlerCallback
    ) {
        self.asyncCallback = callback
        super.init(name: name, filters: filters, options: options, { _, _ in })
    }
}
#endif
