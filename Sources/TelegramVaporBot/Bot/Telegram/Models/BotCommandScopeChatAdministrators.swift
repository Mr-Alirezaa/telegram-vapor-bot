

/**
 Represents the scope of bot commands, covering all administrators of a specific group or supergroup chat.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeChatAdministrators](https://core.telegram.org/bots/api#botcommandscopechatadministrators)
 */
public final class BotCommandScopeChatAdministrators: Codable {
    /// Custom keys for coding/decoding `BotCommandScopeChatAdministrators` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case chatId = "chat_id"
    }

    /// Scope type, must be chat_administrators
    public var type: String

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatId: ChatId

    public init(type: String, chatId: ChatId) {
        self.type = type
        self.chatId = chatId
    }
}
