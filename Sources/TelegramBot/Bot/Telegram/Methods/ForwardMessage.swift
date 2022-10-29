import Vapor

/// Parameters container struct for `forwardMessage` method
public struct ForwardMessageParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
    public var fromChatID: ChatID

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the forwarded message from forwarding and saving
    public var protectContent: Bool?

    /// Message identifier in the chat specified in from\_chat\_id
    public var messageID: Int

    /// Custom keys for coding/decoding `ForwardMessageParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case fromChatID = "from_chat_id"
        case disableNotification = "disable_notification"
        case protectContent = "protect_content"
        case messageID = "message_id"
    }

    public init(
        chatID: ChatID,
        fromChatID: ChatID,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        messageID: Int
    ) {
        self.chatID = chatID
        self.fromChatID = fromChatID
        self.disableNotification = disableNotification
        self.protectContent = protectContent
        self.messageID = messageID
    }
}

public extension Bot {
    /// Use this method to forward messages of any kind. Service messages can't be forwarded. On success, the sent Message is returned.

    /// SeeAlso Telegram Bot API Reference:
    /// [ForwardMessageParams](https://core.telegram.org/bots/api#forwardmessage)

    /// - Parameters:
    ///     - params: Parameters container, see `ForwardMessageParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Message` type
    @discardableResult func forwardMessage(params: ForwardMessageParams) throws -> EventLoopFuture<Message> {
        let methodURL: URI = .init(string: getMethodURL("forwardMessage"))
        let future: EventLoopFuture<Message> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
