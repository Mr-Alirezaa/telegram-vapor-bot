import Vapor

/// Parameters container struct for `pinChatMessage` method
public struct PinChatMessageParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Identifier of a message to pin
    public var messageID: Int

    /// Pass True if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels and private chats.
    public var disableNotification: Bool?

    /// Custom keys for coding/decoding `PinChatMessageParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case messageID = "message_id"
        case disableNotification = "disable_notification"
    }

    public init(chatID: ChatID, messageID: Int, disableNotification: Bool? = nil) {
        self.chatID = chatID
        self.messageID = messageID
        self.disableNotification = disableNotification
    }
}

public extension Bot {
    /// Use this method to add a message to the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can\_pin\_messages' administrator right in a supergroup or 'can\_edit\_messages' administrator right in a channel. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [PinChatMessageParams](https://core.telegram.org/bots/api#pinchatmessage)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `PinChatMessageParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func pinChatMessage(params: PinChatMessageParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("pinChatMessage"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
