
/// This object represents a video file.
///
/// SeeAlso Telegram Bot API Reference:
/// [Video](https://core.telegram.org/bots/api#video)
public final class Video: Codable {
    /// Custom keys for coding/decoding `Video` struct
    public enum CodingKeys: String, CodingKey {
        case fileID = "file_id"
        case fileUniqueID = "file_unique_id"
        case width
        case height
        case duration
        case thumb
        case fileName = "file_name"
        case mimeType = "mime_type"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileID: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueID: String

    /// Video width as defined by sender
    public var width: Int

    /// Video height as defined by sender
    public var height: Int

    /// Duration of the video in seconds as defined by sender
    public var duration: Int

    /// Optional. Video thumbnail
    public var thumb: PhotoSize?

    /// Optional. Original filename as defined by sender
    public var fileName: String?

    /// Optional. MIME type of the file as defined by sender
    public var mimeType: String?

    /// Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    public var fileSize: Int?

    public init(
        fileID: String,
        fileUniqueID: String,
        width: Int,
        height: Int,
        duration: Int,
        thumb: PhotoSize? = nil,
        fileName: String? = nil,
        mimeType: String? = nil,
        fileSize: Int? = nil
    ) {
        self.fileID = fileID
        self.fileUniqueID = fileUniqueID
        self.width = width
        self.height = height
        self.duration = duration
        self.thumb = thumb
        self.fileName = fileName
        self.mimeType = mimeType
        self.fileSize = fileSize
    }
}
