

/**
 This object represents changes in the status of a chat member.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberUpdated](https://core.telegram.org/bots/api#chatmemberupdated)
 */
public final class ChatMemberUpdated: Codable {

    /// Custom keys for coding/decoding `ChatMemberUpdated` struct
    public enum CodingKeys: String, CodingKey {
        case chat = "chat"
        case from = "from"
        case date = "date"
        case oldChatMember = "old_chat_member"
        case newChatMember = "new_chat_member"
        case inviteLink = "invite_link"
    }

    /// Chat the user belongs to
    public var chat: Chat

    /// Performer of the action, which resulted in the change
    public var from: User

    /// Date the change was done in Unix time
    public var date: Int

    /// Previous information about the chat member
    public var oldChatMember: ChatMember

    /// New information about the chat member
    public var newChatMember: ChatMember

    /// Optional. Chat invite link, which was used by the user to join the chat; for joining by invite link events only.
    public var inviteLink: ChatInviteLink?

    public init (chat: Chat, from: User, date: Int, oldChatMember: ChatMember, newChatMember: ChatMember, inviteLink: ChatInviteLink? = nil) {
        self.chat = chat
        self.from = from
        self.date = date
        self.oldChatMember = oldChatMember
        self.newChatMember = newChatMember
        self.inviteLink = inviteLink
    }
}
