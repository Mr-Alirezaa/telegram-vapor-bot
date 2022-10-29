import Vapor

/// Parameters container struct for `unpinAllChatMessages` method
public struct UnpinAllChatMessagesParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Custom keys for coding/decoding `UnpinAllChatMessagesParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
    }

    public init(chatID: ChatID) {
        self.chatID = chatID
    }
}

public extension Bot {
    /// Use this method to clear the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can\_pin\_messages' administrator right in a supergroup or 'can\_edit\_messages' administrator right in a channel. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [UnpinAllChatMessagesParams](https://core.telegram.org/bots/api#unpinallchatmessages)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `UnpinAllChatMessagesParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func unpinAllChatMessages(params: UnpinAllChatMessagesParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("unpinAllChatMessages"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
