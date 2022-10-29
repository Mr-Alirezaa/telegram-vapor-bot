
/// This object represents an answer of a user in a non-anonymous poll.
///
/// SeeAlso Telegram Bot API Reference:
/// [PollAnswer](https://core.telegram.org/bots/api#pollanswer)
public final class PollAnswer: Codable {
    /// Custom keys for coding/decoding `PollAnswer` struct
    public enum CodingKeys: String, CodingKey {
        case pollID = "poll_id"
        case user
        case optionIDs = "option_ids"
    }

    /// Unique poll identifier
    public var pollID: String

    /// The user, who changed the answer to the poll
    public var user: User

    /// 0-based identifiers of answer options, chosen by the user. May be empty if the user retracted their vote.
    public var optionIDs: [Int]

    public init(pollID: String, user: User, optionIDs: [Int]) {
        self.pollID = pollID
        self.user = user
        self.optionIDs = optionIDs
    }
}
