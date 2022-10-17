
/// Represents the scope of bot commands, covering all group and supergroup chat administrators.
///
/// SeeAlso Telegram Bot API Reference:
/// [BotCommandScopeAllChatAdministrators](https://core.telegram.org/bots/api#botcommandscopeallchatadministrators)
public final class BotCommandScopeAllChatAdministrators: Codable {
    /// Custom keys for coding/decoding `BotCommandScopeAllChatAdministrators` struct
    public enum CodingKeys: String, CodingKey {
        case type
    }

    /// Scope type, must be all\_chat\_administrators
    public var type: String

    public init(type: String) {
        self.type = type
    }
}
