import Vapor

/// Parameters container struct for `copyMessage` method
public struct CopyMessageParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
    public var fromChatID: ChatID

    /// Message identifier in the chat specified in from\_chat\_id
    public var messageID: Int

    /// New caption for media, 0-1024 characters after entities parsing. If not specified, the original caption is kept
    public var caption: String?

    /// Mode for parsing entities in the new caption. See formatting options for more details.
    public var parseMode: ParseMode?

    /// A JSON-serialized list of special entities that appear in the new caption, which can be specified instead of parse\_mode
    public var captionEntities: [MessageEntity]?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// If the message is a reply, ID of the original message
    public var replyToMessageID: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: ReplyMarkup?

    /// Custom keys for coding/decoding `CopyMessageParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case fromChatID = "from_chat_id"
        case messageID = "message_id"
        case caption
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case disableNotification = "disable_notification"
        case protectContent = "protect_content"
        case replyToMessageID = "reply_to_message_id"
        case allowSendingWithoutReply = "allow_sending_without_reply"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID,
        fromChatID: ChatID,
        messageID: Int,
        caption: String? = nil,
        parseMode: ParseMode? = nil,
        captionEntities: [MessageEntity]? = nil,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        replyToMessageID: Int? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) {
        self.chatID = chatID
        self.fromChatID = fromChatID
        self.messageID = messageID
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.disableNotification = disableNotification
        self.protectContent = protectContent
        self.replyToMessageID = replyToMessageID
        self.allowSendingWithoutReply = allowSendingWithoutReply
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to copy messages of any kind. Service messages and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct\_option\_id is known to the bot. The method is analogous to the method forwardMessage, but the copied message doesn't have a link to the original message. Returns the MessageID of the sent message on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [CopyMessageParams](https://core.telegram.org/bots/api#copymessage)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `CopyMessageParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `MessageID` type
    @discardableResult func copyMessage(params: CopyMessageParams) throws -> EventLoopFuture<MessageID> {
        let methodURL: URI = .init(string: getMethodURL("copyMessage"))
        let future: EventLoopFuture<MessageID> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
