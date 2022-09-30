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

    func handle(update: Update, bot: BotProtocol) async {
        await Task {
            do {
                try await asyncCallback(update, bot)
            } catch {
                Bot.log.error(error.logMessage)
            }
        }
        .value
    }
}
#endif
