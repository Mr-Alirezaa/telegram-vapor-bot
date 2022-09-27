

import Vapor

/// DESCRIPTION:
/// Use this method to edit animation, audio, document, photo, or video messages. If a message is part of a message album, then it can be edited only to an audio for audio albums, only to a document for document albums and to a photo or a video otherwise. When an inline message is edited, a new file can't be uploaded; use a previously uploaded file via its file_id or specify a URL. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.


/// Parameters container struct for `editMessageMedia` method
public struct EditMessageMediaParams: Encodable {

    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: ChatId?

    /// Required if inline_message_id is not specified. Identifier of the message to edit
    public var messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public var inlineMessageId: String?

    /// A JSON-serialized object for a new media content of the message
    public var media: InputMedia

    /// A JSON-serialized object for a new inline keyboard.
    public var replyMarkup: InlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageMediaParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case media = "media"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: ChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, media: InputMedia, replyMarkup: InlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.media = media
            self.replyMarkup = replyMarkup
    }
}


public extension Bot {

/**
 Use this method to edit animation, audio, document, photo, or video messages. If a message is part of a message album, then it can be edited only to an audio for audio albums, only to a document for document albums and to a photo or a video otherwise. When an inline message is edited, a new file can't be uploaded; use a previously uploaded file via its file_id or specify a URL. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.

 SeeAlso Telegram Bot API Reference:
 [EditMessageMediaParams](https://core.telegram.org/bots/api#editmessagemedia)
 
 - Parameters:
     - params: Parameters container, see `EditMessageMediaParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `MessageOrBool` type
 */
    @discardableResult
    func editMessageMedia(params: EditMessageMediaParams) throws -> EventLoopFuture<MessageOrBool> {
        let methodURL: URI = .init(string: getMethodURL("editMessageMedia"))
        let future: EventLoopFuture<MessageOrBool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
