
/// This object represents a chat photo.
///
/// SeeAlso Telegram Bot API Reference:
/// [ChatPhoto](https://core.telegram.org/bots/api#chatphoto)
public final class ChatPhoto: Codable {
    /// Custom keys for coding/decoding `ChatPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case smallFileID = "small_file_id"
        case smallFileUniqueID = "small_file_unique_id"
        case bigFileID = "big_file_id"
        case bigFileUniqueID = "big_file_unique_id"
    }

    /// File identifier of small (160x160) chat photo. This file\_id can be used only for photo download and only for as long as the photo is not changed.
    public var smallFileID: String

    /// Unique file identifier of small (160x160) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var smallFileUniqueID: String

    /// File identifier of big (640x640) chat photo. This file\_id can be used only for photo download and only for as long as the photo is not changed.
    public var bigFileID: String

    /// Unique file identifier of big (640x640) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var bigFileUniqueID: String

    public init(smallFileID: String, smallFileUniqueID: String, bigFileID: String, bigFileUniqueID: String) {
        self.smallFileID = smallFileID
        self.smallFileUniqueID = smallFileUniqueID
        self.bigFileID = bigFileID
        self.bigFileUniqueID = bigFileUniqueID
    }
}
