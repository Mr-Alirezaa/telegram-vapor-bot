
/// Describes why a request was unsuccessful.
///
/// SeeAlso Telegram Bot API Reference:
/// [ResponseParameters](https://core.telegram.org/bots/api#responseparameters)
public final class ResponseParameters: Codable {
    /// Custom keys for coding/decoding `ResponseParameters` struct
    public enum CodingKeys: String, CodingKey {
        case migrateToChatID = "migrate_to_chat_id"
        case retryAfter = "retry_after"
    }

    /// Optional. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    public var migrateToChatID: Int64?

    /// Optional. In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
    public var retryAfter: Int?

    public init(migrateToChatID: Int64? = nil, retryAfter: Int? = nil) {
        self.migrateToChatID = migrateToChatID
        self.retryAfter = retryAfter
    }
}
