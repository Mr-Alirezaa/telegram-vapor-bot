//
//
//

//

import Foundation
import SwiftRegularExpression

public class RegexpHandler: HandlerProtocol {
    
    public var id: Int = 0
    public var name: String
    
    let regexp: NSRegularExpression
    let callback: HandlerCallback
    let filters: Filter
    
    public init(
        name: String = String(describing: RegexpHandler.self),
        regexp: NSRegularExpression,
        filters: Filter = .all,
        _ callback: @escaping HandlerCallback
    ) {
        self.name = name
        self.regexp = regexp
        self.filters = filters
        self.callback = callback
    }
    
    public convenience init?(
        name: String = String(describing: RegexpHandler.self),
        pattern: String,
        filters: Filter = .all,
        _ callback: @escaping HandlerCallback
    ) {
        guard let regexp = try? NSRegularExpression(pattern: pattern, options: []) else {
            return nil
        }
        self.init(
            name: name,
            regexp: regexp,
            filters: filters,
            callback
        )
    }
    
    public func check(update: Update) -> Bool {
        guard let text = update.message?.text else { return false }
        return text.regexp(regexp.pattern, regexp.options).keys.count > 0
    }
    
    public func handle(update: Update, bot: BotProtocol) {
        do {
            try callback(update, bot)
        } catch {
            Bot.log.error(error.logMessage)
        }
    }
}
