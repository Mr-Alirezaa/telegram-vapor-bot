

/**
 This object contains information about one answer option in a poll.

 SeeAlso Telegram Bot API Reference:
 [PollOption](https://core.telegram.org/bots/api#polloption)
 */
public final class PollOption: Codable {
    /// Custom keys for coding/decoding `PollOption` struct
    public enum CodingKeys: String, CodingKey {
        case text
        case voterCount = "voter_count"
    }

    /// Option text, 1-100 characters
    public var text: String

    /// Number of users that voted for this option
    public var voterCount: Int

    public init(text: String, voterCount: Int) {
        self.text = text
        self.voterCount = voterCount
    }
}
