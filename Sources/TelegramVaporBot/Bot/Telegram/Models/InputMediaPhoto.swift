
/// Represents a photo to be sent.
///
/// SeeAlso Telegram Bot API Reference:
/// [InputMediaPhoto](https://core.telegram.org/bots/api#inputmediaphoto)
public final class InputMediaPhoto: Encodable {
    /// Custom keys for coding/decoding `InputMediaPhoto` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case media
        case caption
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
    }

    /// Type of the result, must be photo
    public var type: String

    /// File to send. Pass a file\_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file\_attach\_name>” to upload a new one using multipart/form-data under <file\_attach\_name> name. [More information on Sending Files](https://core.telegram.org/bots/api#sending-files)
    public var media: String

    /// Optional. Caption of the photo to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the photo caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse\_mode
    public var captionEntities: [MessageEntity]?

    public init(
        type: String,
        media: String,
        caption: String? = nil,
        parseMode: String? = nil,
        captionEntities: [MessageEntity]? = nil
    ) {
        self.type = type
        self.media = media
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
    }
}
