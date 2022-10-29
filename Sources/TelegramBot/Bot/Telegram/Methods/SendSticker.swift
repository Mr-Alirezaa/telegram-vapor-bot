import Vapor

/// Parameters container struct for `sendSticker` method
public struct SendStickerParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Sticker to send. Pass a file\_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a .WEBP file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files »
    public var sticker: FileInfo

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

    /// Custom keys for coding/decoding `SendStickerParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case sticker
        case disableNotification = "disable_notification"
        case protectContent = "protect_content"
        case replyToMessageID = "reply_to_message_id"
        case allowSendingWithoutReply = "allow_sending_without_reply"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID,
        sticker: FileInfo,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        replyToMessageID: Int? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) {
        self.chatID = chatID
        self.sticker = sticker
        self.disableNotification = disableNotification
        self.protectContent = protectContent
        self.replyToMessageID = replyToMessageID
        self.allowSendingWithoutReply = allowSendingWithoutReply
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to send static .WEBP, animated .S, or video .WEBM stickers. On success, the sent Message is returned.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SendStickerParams](https://core.telegram.org/bots/api#sendsticker)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SendStickerParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Message` type
    @discardableResult func sendSticker(params: SendStickerParams) throws -> EventLoopFuture<Message> {
        let methodURL: URI = .init(string: getMethodURL("sendSticker"))
        let future: EventLoopFuture<Message> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
