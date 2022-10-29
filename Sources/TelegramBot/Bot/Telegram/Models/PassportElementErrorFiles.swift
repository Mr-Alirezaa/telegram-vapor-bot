
/// Represents an issue with a list of scans. The error is considered resolved when the list of files containing the scans changes.
///
/// SeeAlso Telegram Bot API Reference:
/// [PassportElementErrorFiles](https://core.telegram.org/bots/api#passportelementerrorfiles)
public final class PassportElementErrorFiles: Codable {
    /// Custom keys for coding/decoding `PassportElementErrorFiles` struct
    public enum CodingKeys: String, CodingKey {
        case source
        case type
        case fileHashes = "file_hashes"
        case message
    }

    /// Error source, must be files
    public var source: String

    /// The section of the user's Telegram Passport which has the issue, one of “utility\_bill”, “bank\_statement”, “rental\_agreement”, “passport\_registration”, “temporary\_registration”
    public var type: String

    /// List of base64-encoded file hashes
    public var fileHashes: [String]

    /// Error message
    public var message: String

    public init(source: String, type: String, fileHashes: [String], message: String) {
        self.source = source
        self.type = type
        self.fileHashes = fileHashes
        self.message = message
    }
}
