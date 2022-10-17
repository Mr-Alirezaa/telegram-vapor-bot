
/// Represents an issue with the translated version of a document. The error is considered resolved when a file with the document translation change.
///
/// SeeAlso Telegram Bot API Reference:
/// [PassportElementErrorTranslationFiles](https://core.telegram.org/bots/api#passportelementerrortranslationfiles)
public final class PassportElementErrorTranslationFiles: Codable {
    /// Custom keys for coding/decoding `PassportElementErrorTranslationFiles` struct
    public enum CodingKeys: String, CodingKey {
        case source
        case type
        case fileHashes = "file_hashes"
        case message
    }

    /// Error source, must be translation\_files
    public var source: String

    /// Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver\_license”, “identity\_card”, “internal\_passport”, “utility\_bill”, “bank\_statement”, “rental\_agreement”, “passport\_registration”, “temporary\_registration”
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
