
/// Represents an animation file (GIF or H.264/MPEG-4 AVC video without sound) to be sent.
///
/// SeeAlso Telegram Bot API Reference:
/// [InputMediaAnimation](https://core.telegram.org/bots/api#inputmediaanimation)
public final class InputMediaAnimation: Encodable {
    /// Custom keys for coding/decoding `InputMediaAnimation` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case media
        case thumb
        case caption
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case width
        case height
        case duration
    }

    /// Type of the result, must be animation
    public var type: String

    /// File to send. Pass a file\_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file\_attach\_name>” to upload a new one using multipart/form-data under <file\_attach\_name> name. [More information on Sending Files](https://core.telegram.org/bots/api#sending-files)
    public var media: String

    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file\_attach\_name>” if the thumbnail was uploaded using multipart/form-data under <file\_attach\_name>. [More information on Sending Files](https://core.telegram.org/bots/api#sending-files)
    public var thumb: FileInfo?

    /// Optional. Caption of the animation to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the animation caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse\_mode
    public var captionEntities: [MessageEntity]?

    /// Optional. Animation width
    public var width: Int?

    /// Optional. Animation height
    public var height: Int?

    /// Optional. Animation duration in seconds
    public var duration: Int?

    public init(
        type: String,
        media: String,
        thumb: FileInfo? = nil,
        caption: String? = nil,
        parseMode: String? = nil,
        captionEntities: [MessageEntity]? = nil,
        width: Int? = nil,
        height: Int? = nil,
        duration: Int? = nil
    ) {
        self.type = type
        self.media = media
        self.thumb = thumb
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.width = width
        self.height = height
        self.duration = duration
    }
}
