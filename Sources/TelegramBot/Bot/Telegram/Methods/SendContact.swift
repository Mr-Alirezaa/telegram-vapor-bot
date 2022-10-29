import Vapor

/// Parameters container struct for `sendContact` method
public struct SendContactParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Contact's phone number
    public var phoneNumber: String

    /// Contact's first name
    public var firstName: String

    /// Contact's last name
    public var lastName: String?

    /// Additional data about the contact in the form of a vCard, 0-2048 bytes
    public var vcard: String?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// If the message is a reply, ID of the original message
    public var replyToMessageID: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove keyboard or to force a reply from the user.
    public var replyMarkup: ReplyMarkup?

    /// Custom keys for coding/decoding `SendContactParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case phoneNumber = "phone_number"
        case firstName = "first_name"
        case lastName = "last_name"
        case vcard
        case disableNotification = "disable_notification"
        case protectContent = "protect_content"
        case replyToMessageID = "reply_to_message_id"
        case allowSendingWithoutReply = "allow_sending_without_reply"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID,
        phoneNumber: String,
        firstName: String,
        lastName: String? = nil,
        vcard: String? = nil,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        replyToMessageID: Int? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) {
        self.chatID = chatID
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.vcard = vcard
        self.disableNotification = disableNotification
        self.protectContent = protectContent
        self.replyToMessageID = replyToMessageID
        self.allowSendingWithoutReply = allowSendingWithoutReply
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to send phone contacts. On success, the sent Message is returned.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SendContactParams](https://core.telegram.org/bots/api#sendcontact)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SendContactParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Message` type
    @discardableResult func sendContact(params: SendContactParams) throws -> EventLoopFuture<Message> {
        let methodURL: URI = .init(string: getMethodURL("sendContact"))
        let future: EventLoopFuture<Message> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
