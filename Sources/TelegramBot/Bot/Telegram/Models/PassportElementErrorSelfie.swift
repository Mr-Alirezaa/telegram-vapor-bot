
/// Represents an issue with the selfie with a document. The error is considered resolved when the file with the selfie changes.
///
/// SeeAlso Telegram Bot API Reference:
/// [PassportElementErrorSelfie](https://core.telegram.org/bots/api#passportelementerrorselfie)
public final class PassportElementErrorSelfie: Codable {
    /// Custom keys for coding/decoding `PassportElementErrorSelfie` struct
    public enum CodingKeys: String, CodingKey {
        case source
        case type
        case fileHash = "file_hash"
        case message
    }

    /// Error source, must be selfie
    public var source: String

    /// The section of the user's Telegram Passport which has the issue, one of “passport”, “driver\_license”, “identity\_card”, “internal\_passport”
    public var type: String

    /// Base64-encoded hash of the file with the selfie
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
