import Foundation
import SwiftRegularExpression

public class RegexHandler: HandlerProtocol {
    public var id = 0
    public var name: String
    public let callback: HandlerCallback

    let regex: NSRegularExpression
    let filters: Filter

    public init(
        name: String = String(describing: RegexHandler.self),
        regex: NSRegularExpression,
        filters: Filter = .all,
        _ callback: @escaping HandlerCallback
    ) {
        self.name = name
        self.regex = regex
        self.filters = filters
        self.callback = callback
    }

    public convenience init?(
        name: String = String(describing: RegexHandler.self),
        pattern: String,
        filters: Filter = .all,
        _ callback: @escaping HandlerCallback
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

    public func check(update: Update) -> Bool {
        guard let text = update.message?.text else { return false }
        return text.regexp(regex.pattern, regex.options).keys.count > 0
    }

    public func handle(update: Update, bot: BotProtocol) {
        do {
            try callback(update, bot)
        } catch {
            Bot.log.error(error.logMessage)
        }
    }
}
