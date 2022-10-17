import Vapor

/// Parameters container struct for `unpinChatMessage` method
public struct UnpinChatMessageParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Identifier of a message to unpin. If not specified, the most recent pinned message (by sending date) will be unpinned.
    public var messageID: Int?

    /// Custom keys for coding/decoding `UnpinChatMessageParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case messageID = "message_id"
    }

    public init(chatID: ChatID, messageID: Int? = nil) {
        self.chatID = chatID
        self.messageID = messageID
    }
}

public extension Bot {
    /// Use this method to remove a message from the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can\_pin\_messages' administrator right in a supergroup or 'can\_edit\_messages' administrator right in a channel. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [UnpinChatMessageParams](https://core.telegram.org/bots/api#unpinchatmessage)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `UnpinChatMessageParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func unpinChatMessage(params: UnpinChatMessageParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("unpinChatMessage"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
