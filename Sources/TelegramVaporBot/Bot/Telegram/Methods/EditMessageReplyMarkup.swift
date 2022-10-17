import Vapor

/// Parameters container struct for `editMessageReplyMarkup` method
public struct EditMessageReplyMarkupParams: Encodable {
    /// Required if inlin\_messag\_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID?

    /// Required if inlin\_messag\_id is not specified. Identifier of the message to edit
    public var messageID: Int?

    /// Required if cha\_id and messag\_id are not specified. Identifier of the inline message
    public var inlineMessageID: String?

    /// A JSON-serialized object for an inline keyboard.
    public var replyMarkup: InlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageReplyMarkupParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "cha_id"
        case messageID = "message_id"
        case inlineMessageID = "inline_message_id"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID? = nil,
        messageID: Int? = nil,
        inlineMessageID: String? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) {
        self.chatID = chatID
        self.messageID = messageID
        self.inlineMessageID = inlineMessageID
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to edit only the reply markup of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [EditMessageReplyMarkupParams](https://core.telegram.org/bots/api#editmessagereplymarkup)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `EditMessageReplyMarkupParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `MessageOrBool` type
    @discardableResult func editMessageReplyMarkup(params: EditMessageReplyMarkupParams? = nil) throws
        -> EventLoopFuture<MessageOrBool>
    {
        let methodURL: URI = .init(string: getMethodURL("editMessageReplyMarkup"))
        let future: EventLoopFuture<MessageOrBool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
