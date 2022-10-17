
/// This object represent a user's profile pictures.
///
/// SeeAlso Telegram Bot API Reference:
/// [UserProfilePhotos](https://core.telegram.org/bots/api#userprofilephotos)
public final class UserProfilePhotos: Codable {
    /// Custom keys for coding/decoding `UserProfilePhotos` struct
    public enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case photos
    }

    /// Total number of profile pictures the target user has
    public var totalCount: Int

    /// Requested profile pictures (in up to 4 sizes each)
    public var photos: [[PhotoSize]]

    public init(totalCount: Int, photos: [[PhotoSize]]) {
        self.totalCount = totalCount
        self.photos = photos
    }
}
