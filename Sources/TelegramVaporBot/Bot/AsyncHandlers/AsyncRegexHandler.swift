#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation

public class AsyncRegexHandler: RegexHandler, AsyncHandlerProtocol {
    public let asyncCallback: AsyncHandlerCallback

    public init(
        name: String = String(describing: RegexHandler.self),
        regex: NSRegularExpression,
        filters: Filter = .all,
        _ callback: @escaping AsyncHandlerCallback
    ) {
        self.asyncCallback = callback
        super.init(name: name, regex: regex, filters: filters, { _, _ in })
    }

    public convenience init?(
        name: String = String(describing: RegexHandler.self),
        pattern: String,
        filters: Filter = .all,
        _ callback: @escaping AsyncHandlerCallback
    ) {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return nil
        }
        self.init(
            name: name,
            regex: regex,
            filters: filters,
            callback
        )
    }
}
#endif

