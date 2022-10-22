import NIOCore

public extension Message {
    /// Helper method to easily delete message
    ///
    /// - Parameters:
    ///    - bot: Bot from which message is being deleted
    ///
    /// - Throws: Throws on errors
    /// - Returns: An `EventLoopFuture` promising the result of the deleteMessage request
    @discardableResult
    func delete(with bot: BotProtocol) throws -> EventLoopFuture<Bool> {
        let params = DeleteMessageParams(chatID: .chat(chat.id), messageID: messageID)

        return try bot.deleteMessage(params: params)
    }

    /// Helper method to easily delete message
    ///
    /// - Parameters:
    ///    - bot: Bot from which message is being deleted
    ///
    /// - Throws: Throws on errors
    /// - Returns: Result of deleteMessage request
    @discardableResult
    func delete(with bot: BotProtocol) async throws -> Bool {
        try await delete(with: bot).get()
    }
}
