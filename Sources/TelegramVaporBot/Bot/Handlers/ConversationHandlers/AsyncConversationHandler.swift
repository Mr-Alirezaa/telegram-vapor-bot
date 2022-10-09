import Foundation

class AsyncConversationHandler<State: Hashable>: AsyncHandler {
    typealias ResultType = Void

    var id: Int

    public var entryPoints: [AnyAsyncHandler<State?>]
    public var states: [State: [AnyAsyncHandler<State?>]]
    public var fallbacks: [any AsyncHandler]
    //    public var timeoutBehavior: [HandlerProtocol] = []

    private var userState: [Int64: State] = [:]

    init(
        of type: State.Type,
        id: Int = 0,
        entryPoints: [AnyAsyncHandler<State?>] = [],
        states: [State: [AnyAsyncHandler<State?>]] = [:],
        fallbacks: [any AsyncHandler] = []
    ) {
        self.id = id
        self.entryPoints = entryPoints
        self.states = states
        self.fallbacks = fallbacks
    }

    func check(update: Update) -> Bool {
        guard let from = update.from else { return false }
        if let state = userState[from.id], let handlers = states[state] {
            if fallbacks.check(update: update) {
                return true
            }

            return handlers.check(update: update)
        }

        if entryPoints.check(update: update) {
            return true
        }

        return false
    }

    private func firstSatisfyingFallbackHandler(update: Update) -> (any AsyncHandler)? {
        guard isUpdateInConversation(update: update) else { return nil }
        return fallbacks.first { $0.check(update: update) }
    }

    private func firstSatisfyingEntryPointsHandler(update: Update) -> AnyAsyncHandler<State?>? {
        guard !isUpdateInConversation(update: update) else { return nil }
        return entryPoints.first { $0.check(update: update) }
    }

    private func firstSatisfyingCurrentHandler(update: Update) -> AnyAsyncHandler<State?>? {
        guard let from = update.from,
              let currentState = userState[from.id],
              let handlers = states[currentState]
        else {
            return nil
        }

        return handlers.first { $0.check(update: update) }
    }

    private func isUpdateInConversation(update: Update) -> Bool {
        guard let from = update.from else { return true }
        return userState.keys.contains(from.id)
    }

    func handle(update: Update, bot: BotProtocol) async throws {
        if let from = update.from {
            if isUpdateInConversation(update: update) {
                if let fallbackHandler = firstSatisfyingFallbackHandler(update: update) {
                    try await fallbackHandler.handle(update: update, bot: bot)
                    userState[from.id] = nil
                    return
                }

                let handler = firstSatisfyingCurrentHandler(update: update)
                if let handler = handler {
                    let newState = try await handler.handle(update: update, bot: bot)
                    userState[from.id] = newState
                } else {
                    userState[from.id] = nil
                }
            } else {
                if let entryPointHandler = firstSatisfyingEntryPointsHandler(update: update) {
                    let state = try await entryPointHandler.handle(update: update, bot: bot)
                    if let state = state {
                        userState[from.id] = state
                    }
                }
            }
        }
    }
}

extension AsyncHandler {
    func typeErased() -> AnyAsyncHandler<ResultType> {
        AnyAsyncHandler(self)
    }
}

extension Array where Element: AsyncHandler {
    func check(update: Update) -> Bool {
        first { $0.check(update: update) } != nil
    }

    func compactHandle(update: Update, bot: BotProtocol) async throws -> [Element.ResultType] {
        try await withThrowingTaskGroup(of: Element.ResultType.self, returning: [Element.ResultType].self) { group in
            for element in self {
                group.addTask {
                    try await element.handle(update: update, bot: bot)
                }
            }

            var all: [Element.ResultType] = []
            for try await item in group {
                all.append(item)
            }

            return all
        }
    }
}

extension Array where Element == (any AsyncHandler) {
    func check(update: Update) -> Bool {
        first { $0.check(update: update) } != nil
    }
}
