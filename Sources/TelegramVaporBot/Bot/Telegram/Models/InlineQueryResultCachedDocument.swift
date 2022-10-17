
/// Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input\_message\_content to send a message with the specified content instead of the file.
///
/// SeeAlso Telegram Bot API Reference:
/// [InlineQueryResultCachedDocument](https://core.telegram.org/bots/api#inlinequeryresultcacheddocument)
public final class InlineQueryResultCachedDocument: Codable {
    /// Custom keys for coding/decoding `InlineQueryResultCachedDocument` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case id
        case title
        case documentFileID = "document_file_id"
        case description
        case caption
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be document
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// Title for the result
    public var title: String

    /// A valid file identifier for the file
    public var documentFileID: String

    /// Optional. Short description of the result
    public var description: String?

    /// Optional. Caption of the document to be sent, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the document caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse\_mode
    public var captionEntities: [MessageEntity]?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: InlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the file
    public var inputMessageContent: InputMessageContent?

    public init(
        type: String,
        id: String,
        title: String,
        documentFileID: String,
        description: String? = nil,
        caption: String? = nil,
        parseMode: String? = nil,
        captionEntities: [MessageEntity]? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil,
        inputMessageContent: InputMessageContent? = nil
    ) {
        self.type = type
        self.id = id
        self.title = title
        self.documentFileID = documentFileID
        self.description = description
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
