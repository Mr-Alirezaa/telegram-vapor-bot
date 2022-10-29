import Foundation

public protocol BaseRegexHandler: HandlerProtocol {
    var regex: NSRegularExpression { get }
    var filters: Filter { get }
}

public extension BaseRegexHandler {
    func check(update: Update) -> Bool {
        guard let text = update.message?.text else { return false }
        return text.regexp(regex.pattern, regex.options).keys.count > 0
    }
}
