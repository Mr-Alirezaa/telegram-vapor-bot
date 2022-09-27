import Vapor

/// DESCRIPTION:
/// Use this method to stop a poll which was sent by the bot. On success, the stopped Poll is returned.

/// Parameters container struct for `stopPoll` method
public struct StopPollParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: ChatId

    /// Identifier of the original message with the poll
    public var messageId: Int

    /// A JSON-serialized object for a new message inline keyboard.
    public var replyMarkup: InlineKeyboardMarkup?

    /// Custom keys for coding/decoding `StopPollParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatId = "chat_id"
        case messageId = "message_id"
        case replyMarkup = "reply_markup"
    }

    public init(chatId: ChatId, messageId: Int, replyMarkup: InlineKeyboardMarkup? = nil) {
        self.chatId = chatId
        self.messageId = messageId
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /**
     Use this method to stop a poll which was sent by the bot. On success, the stopped Poll is returned.

     SeeAlso Telegram Bot API Reference:
     [StopPollParams](https://core.telegram.org/bots/api#stoppoll)

     - Parameters:
         - params: Parameters container, see `StopPollParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `Poll` type
     */
    @discardableResult
    func stopPoll(params: StopPollParams) throws -> EventLoopFuture<Poll> {
        let methodURL: URI = .init(string: getMethodURL("stopPoll"))
        let future: EventLoopFuture<Poll> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
