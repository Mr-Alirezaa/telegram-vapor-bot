// Telegram-vapor-bot - Telegram Bot Swift SDK.

/**
 This object represents a chat photo.

 SeeAlso Telegram Bot API Reference:
 [ChatPhoto](https://core.telegram.org/bots/api#chatphoto)
 */
public final class TGChatPhoto: Codable {

    /// Custom keys for coding/decoding `ChatPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case smallFileId = "small_file_id"
        case smallFileUniqueId = "small_file_unique_id"
        case bigFileId = "big_file_id"
        case bigFileUniqueId = "big_file_unique_id"
    }

    /// File identifier of small (160x160) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
    public var smallFileId: String

    /// Unique file identifier of small (160x160) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var smallFileUniqueId: String

    /// File identifier of big (640x640) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.
    public var bigFileId: String

    /// Unique file identifier of big (640x640) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var bigFileUniqueId: String

    public init (smallFileId: String, smallFileUniqueId: String, bigFileId: String, bigFileUniqueId: String) {
        self.smallFileId = smallFileId
        self.smallFileUniqueId = smallFileUniqueId
        self.bigFileId = bigFileId
        self.bigFileUniqueId = bigFileUniqueId
    }
}
