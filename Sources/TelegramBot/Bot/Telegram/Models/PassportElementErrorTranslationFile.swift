
/// Represents an issue with one of the files that constitute the translation of a document. The error is considered resolved when the file changes.
///
/// SeeAlso Telegram Bot API Reference:
/// [PassportElementErrorTranslationFile](https://core.telegram.org/bots/api#passportelementerrortranslationfile)
public final class PassportElementErrorTranslationFile: Codable {
    /// Custom keys for coding/decoding `PassportElementErrorTranslationFile` struct
    public enum CodingKeys: String, CodingKey {
        case source
        case type
        case fileHash = "file_hash"
        case message
    }

    /// Error source, must be translation\_file
    public var source: String

    /// Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver\_license”, “identity\_card”, “internal\_passport”, “utility\_bill”, “bank\_statement”, “rental\_agreement”, “passport\_registration”, “temporary\_registration”
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
