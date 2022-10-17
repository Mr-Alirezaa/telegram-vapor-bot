
/// This object represents an inline keyboard that appears right next to the message it belongs to.
///
/// SeeAlso Telegram Bot API Reference:
/// [InlineKeyboardMarkup](https://core.telegram.org/bots/api#inlinekeyboardmarkup)
public final class InlineKeyboardMarkup: Codable {
    /// Custom keys for coding/decoding `InlineKeyboardMarkup` struct
    public enum CodingKeys: String, CodingKey {
        case inlineKeyboard = "inline_keyboard"
    }

    /// Array of button rows, each represented by an Array of InlineKeyboardButton objects
    public var inlineKeyboard: [[InlineKeyboardButton]]

    public init(inlineKeyboard: [[InlineKeyboardButton]]) {
        self.inlineKeyboard = inlineKeyboard
    }
}
