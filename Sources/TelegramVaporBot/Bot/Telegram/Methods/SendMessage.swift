import Vapor

/// Parameters container struct for `sendMessage` method
public struct SendMessageParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Text of the message to be sent, 1-4096 characters after entities parsing
    public var text: String

    /// Mode for parsing entities in the message text. See formatting options for more details.
    public var parseMode: ParseMode?

    /// A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse\_mode
    public var entities: [MessageEntity]?

    /// Disables link previews for links in this message
    public var disableWebPagePreview: Bool?

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

    /// Custom keys for coding/decoding `SendMessageParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case text
        case parseMode = "parse_mode"
        case entities
        case disableWebPagePreview = "disable_web_page_preview"
        case disableNotification = "disable_notification"
        case protectContent = "protect_content"
        case replyToMessageID = "reply_to_message_id"
        case allowSendingWithoutReply = "allow_sending_without_reply"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID,
        text: String,
        parseMode: ParseMode? = nil,
        entities: [MessageEntity]? = nil,
        disableWebPagePreview: Bool? = nil,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        replyToMessageID: Int? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) {
        self.chatID = chatID
        self.text = text
        self.parseMode = parseMode
        self.entities = entities
        self.disableWebPagePreview = disableWebPagePreview
        self.disableNotification = disableNotification
        self.protectContent = protectContent
        self.replyToMessageID = replyToMessageID
        self.allowSendingWithoutReply = allowSendingWithoutReply
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to send text messages. On success, the sent Message is returned.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SendMessageParams](https://core.telegram.org/bots/api#sendmessage)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SendMessageParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Message` type
    @discardableResult func sendMessage(params: SendMessageParams) throws -> EventLoopFuture<Message> {
        let methodURL: URI = .init(string: getMethodURL("sendMessage"))
        let future: EventLoopFuture<Message> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
