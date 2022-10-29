
/// Represents the scope of bot commands, covering a specific member of a group or supergroup chat.
///
/// SeeAlso Telegram Bot API Reference:
/// [BotCommandScopeChatMember](https://core.telegram.org/bots/api#botcommandscopechatmember)
public final class BotCommandScopeChatMember: Codable {
    /// Custom keys for coding/decoding `BotCommandScopeChatMember` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case chatID = "chat_id"
        case userID = "user_id"
    }

    /// Scope type, must be chat\_member
    public var type: String

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatID: ChatID

    /// Unique identifier of the target user
    public var userID: Int64

    public init(type: String, chatID: ChatID, userID: Int64) {
        self.type = type
        self.chatID = chatID
        self.userID = userID
    }
}
