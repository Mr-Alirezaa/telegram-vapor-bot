

/**
 This object represents one row of the high scores table for a game.

 SeeAlso Telegram Bot API Reference:
 [GameHighScore](https://core.telegram.org/bots/api#gamehighscore)
 */
public final class GameHighScore: Codable {
    /// Custom keys for coding/decoding `GameHighScore` struct
    public enum CodingKeys: String, CodingKey {
        case position
        case user
        case score
    }

    /// Position in high score table for the game
    public var position: Int

    /// User
    public var user: User

    /// Score
    public var score: Int

    public init(position: Int, user: User, score: Int) {
        self.position = position
        self.user = user
        self.score = score
    }
}
