

/**
 Represents a chat member that isn't currently a member of the chat, but may join it themselves.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberLeft](https://core.telegram.org/bots/api#chatmemberleft)
 */
public final class ChatMemberLeft: Codable {
    /// Custom keys for coding/decoding `ChatMemberLeft` struct
    public enum CodingKeys: String, CodingKey {
        case status
        case user
    }

    /// The member's status in the chat, always “left”
    public var status: String

    /// Information about the user
    public var user: User

    public init(status: String, user: User) {
        self.status = status
        self.user = user
    }
}
