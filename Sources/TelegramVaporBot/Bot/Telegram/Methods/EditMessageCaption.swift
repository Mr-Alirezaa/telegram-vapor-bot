

import Vapor

/// DESCRIPTION:
/// Use this method to edit captions of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.


/// Parameters container struct for `editMessageCaption` method
public struct EditMessageCaptionParams: Encodable {

    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: ChatId?

    /// Required if inline_message_id is not specified. Identifier of the message to edit
    public var messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public var inlineMessageId: String?

    /// New caption of the message, 0-1024 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the message caption. See formatting options for more details.
    public var parseMode: ParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [MessageEntity]?

    /// A JSON-serialized object for an inline keyboard.
    public var replyMarkup: InlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageCaptionParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: ChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, caption: String? = nil, parseMode: ParseMode? = nil, captionEntities: [MessageEntity]? = nil, replyMarkup: InlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.replyMarkup = replyMarkup
    }
}


public extension Bot {

/**
 Use this method to edit captions of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.

 SeeAlso Telegram Bot API Reference:
 [EditMessageCaptionParams](https://core.telegram.org/bots/api#editmessagecaption)
 
 - Parameters:
     - params: Parameters container, see `EditMessageCaptionParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `MessageOrBool` type
 */
    @discardableResult
    func editMessageCaption(params: EditMessageCaptionParams? = nil) throws -> EventLoopFuture<MessageOrBool> {
        let methodURL: URI = .init(string: getMethodURL("editMessageCaption"))
        let future: EventLoopFuture<MessageOrBool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
