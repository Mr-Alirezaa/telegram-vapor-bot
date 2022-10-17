import Foundation
import SwiftRegularExpression
import Vapor

public class RegexHandler<ResultType>: BaseRegexHandler, Handler {
    public typealias CallbackType = (_ update: Update, _ bot: BotProtocol) throws -> ResultType

    public var id = 0
    public var name: String
    public let callback: CallbackType

    public let regex: NSRegularExpression
    public let filters: Filter

    public init(
        name: String = String(describing: RegexHandler<ResultType>.self),
        regex: NSRegularExpression,
        filters: Filter = .all,
        _ callback: @escaping CallbackType
    ) {
        self.name = name
        self.regex = regex
        self.filters = filters
        self.callback = callback
    }

    public convenience init?(
        name: String = String(describing: RegexHandler<ResultType>.self),
        pattern: String,
        filters: Filter = .all,
        _ callback: @escaping CallbackType
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

    public func handle(update: Update, bot: BotProtocol) throws -> ResultType {
        try callback(update, bot)
    }
}
