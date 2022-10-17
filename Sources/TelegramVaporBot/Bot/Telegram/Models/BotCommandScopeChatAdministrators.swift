
/// Represents the scope of bot commands, covering all administrators of a specific group or supergroup chat.
///
/// SeeAlso Telegram Bot API Reference:
/// [BotCommandScopeChatAdministrators](https://core.telegram.org/bots/api#botcommandscopechatadministrators)
public final class BotCommandScopeChatAdministrators: Codable {
    /// Custom keys for coding/decoding `BotCommandScopeChatAdministrators` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case chatID = "chat_id"
    }

    /// Scope type, must be chat\_administrators
    public var type: String

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatID: ChatID

    public init(type: String, chatID: ChatID) {
        self.type = type
        self.chatID = chatID
    }
}
