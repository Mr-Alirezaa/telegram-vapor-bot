import Foundation

public protocol Handler: HandlerProtocol {
    associatedtype ResultType = Void

    @discardableResult
    func handle(update: Update, bot: BotProtocol) throws -> ResultType
}
