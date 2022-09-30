#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

public class AsyncCallbackQueryHandler: CallbackQueryHandler, AsyncHandlerProtocol {
    public let asyncCallback: AsyncHandlerCallback

    public init(
        name: String = String(describing: CallbackQueryHandler.self),
        pattern: String,
        _ callback: @escaping AsyncHandlerCallback
    ) {
        self.asyncCallback = callback
        super.init(name: name, pattern: pattern, { _, _ in })
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
