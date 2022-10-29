import Vapor

/// This method will currently return scores for the target user, plus two of their closest neighbors on each side. Will also return the top three users if the user and their neighbors are not among them. Please note that this behavior is subject to change.

/// Parameters container struct for `getGameHighScores` method
public struct GetGameHighScoresParams: Encodable {
    /// Target user id
    public var userID: Int64

    /// Required if inline\_message\_id is not specified. Unique identifier for the target chat
    public var chatID: Int64?

    /// Required if inline\_message\_id is not specified. Identifier of the sent message
    public var messageID: Int?

    /// Required if chat\_id and message\_id are not specified. Identifier of the inline message
    public var inlineMessageID: String?

    /// Custom keys for coding/decoding `GetGameHighScoresParams` struct
    public enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case chatID = "chat_id"
        case messageID = "message_id"
        case inlineMessageID = "inline_message_id"
    }

    public init(userID: Int64, chatID: Int64? = nil, messageID: Int? = nil, inlineMessageID: String? = nil) {
        self.userID = userID
        self.chatID = chatID
        self.messageID = messageID
        self.inlineMessageID = inlineMessageID
    }
}

public extension Bot {
    /// Use this method to get data for high score tables. Will return the score of the specified user and several of their neighbors in a game. Returns an Array of GameHighScore objects.
    /// This method will currently return scores for the target user, plus two of their closest neighbors on each side. Will also return the top three users if the user and their neighbors are not among them. Please note that this behavior is subject to change.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [GetGameHighScoresParams](https://core.telegram.org/bots/api#getgamehighscores)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `GetGameHighScoresParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `[GameHighScore]` type
    @discardableResult func getGameHighScores(params: GetGameHighScoresParams) throws
        -> EventLoopFuture<[GameHighScore]>
    {
        let methodURL: URI = .init(string: getMethodURL("getGameHighScores"))
        let future: EventLoopFuture<[GameHighScore]> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
