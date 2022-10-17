import Vapor

/// Parameters container struct for `editMessageCaption` method
public struct EditMessageCaptionParams: Encodable {
    /// Required if inline\_message\_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID?

    /// Required if inline\_message\_id is not specified. Identifier of the message to edit
    public var messageID: Int?

    /// Required if chat\_id and message\_id are not specified. Identifier of the inline message
    public var inlineMessageID: String?

    /// New caption of the message, 0-1024 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the message caption. See formatting options for more details.
    public var parseMode: ParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse\_mode
    public var captionEntities: [MessageEntity]?

    /// A JSON-serialized object for an inline keyboard.
    public var replyMarkup: InlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageCaptionParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case messageID = "message_id"
        case inlineMessageID = "inline_message_id"
        case caption
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID? = nil,
        messageID: Int? = nil,
        inlineMessageID: String? = nil,
        caption: String? = nil,
        parseMode: ParseMode? = nil,
        captionEntities: [MessageEntity]? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) {
        self.chatID = chatID
        self.messageID = messageID
        self.inlineMessageID = inlineMessageID
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to edit captions of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [EditMessageCaptionParams](https://core.telegram.org/bots/api#editmessagecaption)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `EditMessageCaptionParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `MessageOrBool` type
    @discardableResult func editMessageCaption(params: EditMessageCaptionParams? = nil) throws
        -> EventLoopFuture<MessageOrBool>
    {
        let methodURL: URI = .init(string: getMethodURL("editMessageCaption"))
        let future: EventLoopFuture<MessageOrBool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
