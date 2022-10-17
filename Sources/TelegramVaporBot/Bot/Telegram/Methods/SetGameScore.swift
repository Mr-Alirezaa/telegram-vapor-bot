import Vapor

/// Parameters container struct for `setGameScore` method
public struct SetGameScoreParams: Encodable {
    /// User identifier
    public var userID: Int64

    /// New score, must be non-negative
    public var score: Int

    /// Pass True if the high score is allowed to decrease. This can be useful when fixing mistakes or banning cheaters
    public var force: Bool?

    /// Pass True if the game message should not be automatically edited to include the current scoreboard
    public var disableEditMessage: Bool?

    /// Required if inline\_message\_id is not specified. Unique identifier for the target chat
    public var chatID: Int64?

    /// Required if inline\_message\_id is not specified. Identifier of the sent message
    public var messageID: Int?

    /// Required if chat\_id and message\_id are not specified. Identifier of the inline message
    public var inlineMessageID: String?

    /// Custom keys for coding/decoding `SetGameScoreParams` struct
    public enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case score
        case force
        case disableEditMessage = "disable_edit_message"
        case chatID = "chat_id"
        case messageID = "message_id"
        case inlineMessageID = "inline_message_id"
    }

    public init(
        userID: Int64,
        score: Int,
        force: Bool? = nil,
        disableEditMessage: Bool? = nil,
        chatID: Int64? = nil,
        messageID: Int? = nil,
        inlineMessageID: String? = nil
    ) {
        self.userID = userID
        self.score = score
        self.force = force
        self.disableEditMessage = disableEditMessage
        self.chatID = chatID
        self.messageID = messageID
        self.inlineMessageID = inlineMessageID
    }
}

public extension Bot {
    /// Use this method to set the score of the specified user in a game message. On success, if the message is not an inline message, the Message is returned, otherwise True is returned. Returns an error, if the new score is not greater than the user's current score in the chat and force is False.

    /// SeeAlso Telegram Bot API Reference:
    /// [SetGameScoreParams](https://core.telegram.org/bots/api#setgamescore)

    /// - Parameters:
    ///     - params: Parameters container, see `SetGameScoreParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `MessageOrBool` type
    @discardableResult func setGameScore(params: SetGameScoreParams) throws -> EventLoopFuture<MessageOrBool> {
        let methodURL: URI = .init(string: getMethodURL("setGameScore"))
        let future: EventLoopFuture<MessageOrBool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
