import Foundation

public typealias AsyncHandlerCallback = (_ update: Update, _ bot: BotProtocol) async throws -> Void

public protocol AsyncHandlerProtocol: HandlerProtocol {
    func handle(update: Update, bot: BotProtocol) async
}
