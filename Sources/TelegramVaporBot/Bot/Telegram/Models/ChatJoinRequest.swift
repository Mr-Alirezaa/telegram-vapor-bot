

/**
 Represents a join request sent to a chat.

 SeeAlso Telegram Bot API Reference:
 [ChatJoinRequest](https://core.telegram.org/bots/api#chatjoinrequest)
 */
public final class ChatJoinRequest: Codable {

    /// Custom keys for coding/decoding `ChatJoinRequest` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case from = "from"
        case date = "date"
        case bio = "bio"
        case inviteLink = "invite_link"
    }

    /// Chat to which the request was sent
    public var chat: Chat

    /// User that sent the join request
    public var from: User

    /// Date the request was sent in Unix time
    public var date: Int

    /// Optional. Bio of the user.
    public var bio: String?

    /// Optional. Chat invite link that was used by the user to send the join request
    public var inviteLink: ChatInviteLink?

    public init (chat: Chat, from: User, date: Int, bio: String? = nil, inviteLink: ChatInviteLink? = nil) {
        self.chat = chat
        self.from = from
        self.date = date
        self.bio = bio
        self.inviteLink = inviteLink
    }
}
