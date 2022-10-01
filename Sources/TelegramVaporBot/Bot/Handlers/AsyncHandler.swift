import Foundation

public protocol AsyncHandler: HandlerProtocol {
    associatedtype ResultType = Void

    @discardableResult
    func handle(update: Update, bot: BotProtocol) async throws -> ResultType
}
