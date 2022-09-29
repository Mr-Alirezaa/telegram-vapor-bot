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
}
#endif
