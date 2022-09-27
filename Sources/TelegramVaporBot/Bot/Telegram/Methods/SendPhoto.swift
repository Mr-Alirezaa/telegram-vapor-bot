

import Vapor

/// DESCRIPTION:
/// Use this method to send photos. On success, the sent Message is returned.


/// Parameters container struct for `sendPhoto` method
public struct SendPhotoParams: Encodable {

    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: ChatId

    /// Photo to send. Pass a file_id as String to send a photo that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a photo from the Internet, or upload a new photo using multipart/form-data. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20. More information on Sending Files »
    public var photo: FileInfo

    /// Photo caption (may also be used when resending photos by file_id), 0-1024 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the photo caption. See formatting options for more details.
    public var parseMode: ParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse_mode
    public var captionEntities: [MessageEntity]?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// If the message is a reply, ID of the original message
    public var replyToMessageId: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: ReplyMarkup?

    /// Custom keys for coding/decoding `SendPhotoParams` struct
    public enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case photo = "photo"
            case caption = "caption"
            case parseMode = "parse_mode"
            case captionEntities = "caption_entities"
            case disableNotification = "disable_notification"
            case protectContent = "protect_content"
            case replyToMessageId = "reply_to_message_id"
            case allowSendingWithoutReply = "allow_sending_without_reply"
            case replyMarkup = "reply_markup"
    }

    public init(chatId: ChatId, photo: FileInfo, caption: String? = nil, parseMode: ParseMode? = nil, captionEntities: [MessageEntity]? = nil, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyToMessageId: Int? = nil, allowSendingWithoutReply: Bool? = nil, replyMarkup: ReplyMarkup? = nil) {
            self.chatId = chatId
            self.photo = photo
            self.caption = caption
            self.parseMode = parseMode
            self.captionEntities = captionEntities
            self.disableNotification = disableNotification
            self.protectContent = protectContent
            self.replyToMessageId = replyToMessageId
            self.allowSendingWithoutReply = allowSendingWithoutReply
            self.replyMarkup = replyMarkup
    }
}


public extension Bot {

/**
 Use this method to send photos. On success, the sent Message is returned.

 SeeAlso Telegram Bot API Reference:
 [SendPhotoParams](https://core.telegram.org/bots/api#sendphoto)
 
 - Parameters:
     - params: Parameters container, see `SendPhotoParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `Message` type
 */
    @discardableResult
    func sendPhoto(params: SendPhotoParams) throws -> EventLoopFuture<Message> {
        let methodURL: URI = .init(string: getMethodURL("sendPhoto"))
        let future: EventLoopFuture<Message> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
