
/// Represents a menu button, which opens the bot's list of commands.
///
/// SeeAlso Telegram Bot API Reference:
/// [MenuButtonCommands](https://core.telegram.org/bots/api#menubuttoncommands)
public final class MenuButtonCommands: Codable {
    /// Custom keys for coding/decoding `MenuButtonCommands` struct
    public enum CodingKeys: String, CodingKey {
        case type
    }

    /// Type of the button, must be commands
    public var type: String

    public init(type: String) {
        self.type = type
    }
}
