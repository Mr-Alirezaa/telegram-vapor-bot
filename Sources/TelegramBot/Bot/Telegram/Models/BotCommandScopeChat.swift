
/// Represents the scope of bot commands, covering a specific chat.
///
/// SeeAlso Telegram Bot API Reference:
/// [BotCommandScopeChat](https://core.telegram.org/bots/api#botcommandscopechat)
public final class BotCommandScopeChat: Codable {
    /// Custom keys for coding/decoding `BotCommandScopeChat` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case chatID = "chat_id"
    }

    /// Scope type, must be chat
    public var type: String

    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatID: ChatID

    public init(type: String, chatID: ChatID) {
        self.type = type
        self.chatID = chatID
    }
}
