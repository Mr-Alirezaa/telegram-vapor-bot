import Vapor

/// DESCRIPTION:
/// Use this method to send a game. On success, the sent Message is returned.

/// Parameters container struct for `sendGame` method
public struct SendGameParams: Encodable {
    /// Unique identifier for the target chat
    public var chatId: Int64

    /// Short name of the game, serves as the unique identifier for the game. Set up your games via @BotFather.
    public var gameShortName: String

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// If the message is a reply, ID of the original message
    public var replyToMessageId: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

    /// A JSON-serialized object for an inline keyboard. If empty, one 'Play game_title' button will be shown. If not empty, the first button must launch the game.
    public var replyMarkup: InlineKeyboardMarkup?

    /// Custom keys for coding/decoding `SendGameParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatId = "chat_id"
        case gameShortName = "game_short_name"
        case disableNotification = "disable_notification"
        case protectContent = "protect_content"
        case replyToMessageId = "reply_to_message_id"
        case allowSendingWithoutReply = "allow_sending_without_reply"
        case replyMarkup = "reply_markup"
    }

    public init(chatId: Int64, gameShortName: String, disableNotification: Bool? = nil, protectContent: Bool? = nil, replyToMessageId: Int? = nil, allowSendingWithoutReply: Bool? = nil, replyMarkup: InlineKeyboardMarkup? = nil) {
        self.chatId = chatId
        self.gameShortName = gameShortName
        self.disableNotification = disableNotification
        self.protectContent = protectContent
        self.replyToMessageId = replyToMessageId
        self.allowSendingWithoutReply = allowSendingWithoutReply
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /**
     Use this method to send a game. On success, the sent Message is returned.

     SeeAlso Telegram Bot API Reference:
     [SendGameParams](https://core.telegram.org/bots/api#sendgame)

     - Parameters:
         - params: Parameters container, see `SendGameParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `Message` type
     */
    @discardableResult
    func sendGame(params: SendGameParams) throws -> EventLoopFuture<Message> {
        let methodURL: URI = .init(string: getMethodURL("sendGame"))
        let future: EventLoopFuture<Message> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
