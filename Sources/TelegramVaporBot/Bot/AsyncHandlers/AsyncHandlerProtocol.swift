import Foundation

public typealias AsyncHandlerCallback = (_ update: Update, _ bot: BotProtocol) async throws -> Void

public protocol AsyncHandlerProtocol: HandlerProtocol {
    var asyncCallback: AsyncHandlerCallback { get }
    func handle(update: Update, bot: BotProtocol) async
}

public extension AsyncHandlerProtocol {
    func handle(update: Update, bot: BotProtocol) async {
        await Task {
            do {
                try await asyncCallback(update, bot)
            } catch {
                Bot.log.error(error.logMessage)
            }
        }
        .value
    }
}
