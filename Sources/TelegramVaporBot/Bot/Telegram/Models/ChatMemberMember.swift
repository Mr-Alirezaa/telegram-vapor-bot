

/**
 Represents a chat member that has no additional privileges or restrictions.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberMember](https://core.telegram.org/bots/api#chatmembermember)
 */
public final class ChatMemberMember: Codable {

    /// Custom keys for coding/decoding `ChatMemberMember` struct
    public enum CodingKeys: String, CodingKey {
        case status = "status"
        case user = "user"
    }

    /// The member's status in the chat, always “member”
    public var status: String

    /// Information about the user
    public var user: User

    public init (status: String, user: User) {
        self.status = status
        self.user = user
    }
}
