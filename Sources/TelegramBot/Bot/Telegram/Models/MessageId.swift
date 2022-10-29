
/// This object represents a unique message identifier.
///
/// SeeAlso Telegram Bot API Reference:
/// [MessageID](https://core.telegram.org/bots/api#messageid)
public final class MessageID: Codable {
    /// Custom keys for coding/decoding `MessageID` struct
    public enum CodingKeys: String, CodingKey {
        case messageID = "message_id"
    }

    /// Unique message identifier
    public var messageID: Int

    public init(messageID: Int) {
        self.messageID = messageID
    }
}
