
/// This object represents a sticker.
///
/// SeeAlso Telegram Bot API Reference:
/// [Sticker](https://core.telegram.org/bots/api#sticker)
public final class Sticker: Codable {
    /// Custom keys for coding/decoding `Sticker` struct
    public enum CodingKeys: String, CodingKey {
        case fileID = "file_id"
        case fileUniqueID = "file_unique_id"
        case type
        case width
        case height
        case isAnimated = "is_animated"
        case isVideo = "is_video"
        case thumb
        case emoji
        case setName = "set_name"
        case premiumAnimation = "premium_animation"
        case maskPosition = "mask_position"
        case customEmojiID = "custom_emoji_id"
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileID: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueID: String

    /// Type of the sticker, currently one of “regular”, “mask”, “custom\_emoji”. The type of the sticker is independent from its format, which is determined by the fields is\_animated and is\_video.
    public var type: String

    /// Sticker width
    public var width: Int

    /// Sticker height
    public var height: Int

    /// True, if the sticker is animated
    public var isAnimated: Bool

    /// True, if the sticker is a video sticker
    public var isVideo: Bool

    /// Optional. Sticker thumbnail in the .WEBP or .JPG format
    public var thumb: PhotoSize?

    /// Optional. Emoji associated with the sticker
    public var emoji: String?

    /// Optional. Name of the sticker set to which the sticker belongs
    public var setName: String?

    /// Optional. For premium regular stickers, premium animation for the sticker
    public var premiumAnimation: File?

    /// Optional. For mask stickers, the position where the mask should be placed
    public var maskPosition: MaskPosition?

    /// Optional. For custom emoji stickers, unique identifier of the custom emoji
    public var customEmojiID: String?

    /// Optional. File size in bytes
    public var fileSize: Int?

    public init(
        fileID: String,
        fileUniqueID: String,
        type: String,
        width: Int,
        height: Int,
        isAnimated: Bool,
        isVideo: Bool,
        thumb: PhotoSize? = nil,
        emoji: String? = nil,
        setName: String? = nil,
        premiumAnimation: File? = nil,
        maskPosition: MaskPosition? = nil,
        customEmojiID: String? = nil,
        fileSize: Int? = nil
    ) {
        self.fileID = fileID
        self.fileUniqueID = fileUniqueID
        self.type = type
        self.width = width
        self.height = height
        self.isAnimated = isAnimated
        self.isVideo = isVideo
        self.thumb = thumb
        self.emoji = emoji
        self.setName = setName
        self.premiumAnimation = premiumAnimation
        self.maskPosition = maskPosition
        self.customEmojiID = customEmojiID
        self.fileSize = fileSize
    }
}
