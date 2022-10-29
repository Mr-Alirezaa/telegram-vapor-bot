import Foundation

public protocol BaseCallbackQueryHandler: HandlerProtocol {
    var pattern: String { get }
}

public extension BaseCallbackQueryHandler {
    func check(update: Update) -> Bool {
        guard let callbackQuery = update.callbackQuery else { return false }
        if let data = callbackQuery.data,
           !data.matchRegex(pattern: pattern)
        {
            return false
        }
        return true
    }
}
