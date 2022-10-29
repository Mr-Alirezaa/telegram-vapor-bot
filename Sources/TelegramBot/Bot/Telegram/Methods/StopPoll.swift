import Vapor

/// Parameters container struct for `stopPoll` method
public struct StopPollParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Identifier of the original message with the poll
    public var messageID: Int

    /// A JSON-serialized object for a new message inline keyboard.
    public var replyMarkup: InlineKeyboardMarkup?

    /// Custom keys for coding/decoding `StopPollParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case messageID = "message_id"
        case replyMarkup = "reply_markup"
    }

    public init(chatID: ChatID, messageID: Int, replyMarkup: InlineKeyboardMarkup? = nil) {
        self.chatID = chatID
        self.messageID = messageID
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to stop a poll which was sent by the bot. On success, the stopped Poll is returned.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [StopPollParams](https://core.telegram.org/bots/api#stoppoll)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `StopPollParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Poll` type
    @discardableResult func stopPoll(params: StopPollParams) throws -> EventLoopFuture<Poll> {
        let methodURL: URI = .init(string: getMethodURL("stopPoll"))
        let future: EventLoopFuture<Poll> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
