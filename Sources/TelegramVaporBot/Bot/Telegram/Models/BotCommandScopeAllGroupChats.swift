

/**
 Represents the scope of bot commands, covering all group and supergroup chats.

 SeeAlso Telegram Bot API Reference:
 [BotCommandScopeAllGroupChats](https://core.telegram.org/bots/api#botcommandscopeallgroupchats)
 */
public final class BotCommandScopeAllGroupChats: Codable {

    /// Custom keys for coding/decoding `BotCommandScopeAllGroupChats` struct
    public enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Scope type, must be all_group_chats
    public var type: String

    public init (type: String) {
        self.type = type
    }
}
