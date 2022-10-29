
/// Represents a link to an MP3 audio file. By default, this audio file will be sent by the user. Alternatively, you can use input\_message\_content to send a message with the specified content instead of the audio.
///
/// SeeAlso Telegram Bot API Reference:
/// [InlineQueryResultAudio](https://core.telegram.org/bots/api#inlinequeryresultaudio)
public final class InlineQueryResultAudio: Codable {
    /// Custom keys for coding/decoding `InlineQueryResultAudio` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case id
        case audioURL = "audio_url"
        case title
        case caption
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case performer
        case audioDuration = "audio_duration"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be audio
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// A valid URL for the audio file
    public var audioURL: String

    /// Title
    public var title: String

    /// Optional. Caption, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the audio caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse\_mode
    public var captionEntities: [MessageEntity]?

    /// Optional. Performer
    public var performer: String?

    /// Optional. Audio duration in seconds
    public var audioDuration: Int?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: InlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the audio
    public var inputMessageContent: InputMessageContent?

    public init(
        type: String,
        id: String,
        audioURL: String,
        title: String,
        caption: String? = nil,
        parseMode: String? = nil,
        captionEntities: [MessageEntity]? = nil,
        performer: String? = nil,
        audioDuration: Int? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil,
        inputMessageContent: InputMessageContent? = nil
    ) {
        self.type = type
        self.id = id
        self.audioURL = audioURL
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.performer = performer
        self.audioDuration = audioDuration
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
