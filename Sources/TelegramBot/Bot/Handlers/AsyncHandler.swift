import Foundation

public protocol AsyncHandler<ResultType>: HandlerProtocol {
    associatedtype ResultType = Void

    @discardableResult func handle(update: Update, bot: BotProtocol) async throws -> ResultType
}

/// Type-erased concrete type conforming to `AsyncHandler`.
class AnyAsyncHandler<State>: AsyncHandler {
    var id: Int {
        get { handler.id }
        set { handler.id = newValue }
    }

    var handler: any AsyncHandler
    typealias ResultType = State

    init<AsyncHandlerType: AsyncHandler>(_ handler: AsyncHandlerType) where AsyncHandlerType.ResultType == State {
        self.handler = handler
    }

    func check(update: TelegramVaporBot.Update) -> Bool {
        handler.check(update: update)
    }

    func handle(update: TelegramVaporBot.Update, bot: TelegramVaporBot.BotProtocol) async throws -> State {
        try await handler.handle(update: update, bot: bot) as! State
    }
}
