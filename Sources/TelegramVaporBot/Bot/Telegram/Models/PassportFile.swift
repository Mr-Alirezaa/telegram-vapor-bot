
/// This object represents a file uploaded to Telegram Passport. Currently all Telegram Passport files are in JPEG format when decrypted and don't exceed 10MB.
///
/// SeeAlso Telegram Bot API Reference:
/// [PassportFile](https://core.telegram.org/bots/api#passportfile)
public final class PassportFile: Codable {
    /// Custom keys for coding/decoding `PassportFile` struct
    public enum CodingKeys: String, CodingKey {
        case fileID = "file_id"
        case fileUniqueID = "file_unique_id"
        case fileSize = "file_size"
        case fileDate = "file_date"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileID: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueID: String

    /// File size in bytes
    public var fileSize: Int

    /// Unix time when the file was uploaded
    public var fileDate: Int

    public init(fileID: String, fileUniqueID: String, fileSize: Int, fileDate: Int) {
        self.fileID = fileID
        self.fileUniqueID = fileUniqueID
        self.fileSize = fileSize
        self.fileDate = fileDate
    }
}
