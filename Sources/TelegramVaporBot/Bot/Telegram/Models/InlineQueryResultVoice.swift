
/// Represents a link to a voice recording in an .OGG container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input\_message\_content to send a message with the specified content instead of the the voice message.
///
/// SeeAlso Telegram Bot API Reference:
/// [InlineQueryResultVoice](https://core.telegram.org/bots/api#inlinequeryresultvoice)
public final class InlineQueryResultVoice: Codable {
    /// Custom keys for coding/decoding `InlineQueryResultVoice` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case id
        case voiceURL = "voice_url"
        case title
        case caption
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case voiceDuration = "voice_duration"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be voice
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// A valid URL for the voice recording
    public var voiceURL: String

    /// Recording title
    public var title: String

    /// Optional. Caption, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the voice message caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse\_mode
    public var captionEntities: [MessageEntity]?

    /// Optional. Recording duration in seconds
    public var voiceDuration: Int?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: InlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the voice recording
    public var inputMessageContent: InputMessageContent?

    public init(
        type: String,
        id: String,
        voiceURL: String,
        title: String,
        caption: String? = nil,
        parseMode: String? = nil,
        captionEntities: [MessageEntity]? = nil,
        voiceDuration: Int? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil,
        inputMessageContent: InputMessageContent? = nil
    ) {
        self.type = type
        self.id = id
        self.voiceURL = voiceURL
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.voiceDuration = voiceDuration
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
