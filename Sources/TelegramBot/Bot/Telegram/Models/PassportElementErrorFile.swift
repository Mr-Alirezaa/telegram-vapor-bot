
/// Represents an issue with a document scan. The error is considered resolved when the file with the document scan changes.
///
/// SeeAlso Telegram Bot API Reference:
/// [PassportElementErrorFile](https://core.telegram.org/bots/api#passportelementerrorfile)
public final class PassportElementErrorFile: Codable {
    /// Custom keys for coding/decoding `PassportElementErrorFile` struct
    public enum CodingKeys: String, CodingKey {
        case source
        case type
        case fileHash = "file_hash"
        case message
    }

    /// Error source, must be file
    public var source: String

    /// The section of the user's Telegram Passport which has the issue, one of “utility\_bill”, “bank\_statement”, “rental\_agreement”, “passport\_registration”, “temporary\_registration”
    public var type: String

    /// Base64-encoded file hash
    public var fileHash: String

    /// Error message
    public var message: String

    public init(source: String, type: String, fileHash: String, message: String) {
        self.source = source
        self.type = type
        self.fileHash = fileHash
        self.message = message
    }
}
