
/// This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.
///
/// SeeAlso Telegram Bot API Reference:
/// [MessageEntity](https://core.telegram.org/bots/api#messageentity)
public final class MessageEntity: Codable {
    /// Custom keys for coding/decoding `MessageEntity` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case offset
        case length
        case url
        case user
        case language
        case customEmojiID = "custom_emoji_id"
    }

    /// Type of the entity. Currently, can be “mention” (@username), “hashtag” (#hashtag), “cashtag” ($USD), “bot\_command” (/start@jobs\_bot), “url” (https://telegram.org), “email” (do-not-reply@telegram.org), “phone\_number” (+1-212-555-0123), “bold” (bold text), “italic” (italic text), “underline” (underlined text), “strikethrough” (strikethrough text), “spoiler” (spoiler message), “code” (monowidth string), “pre” (monowidth block), “text\_link” (for clickable text URLs), “text\_mention” (for users without usernames), “custom\\_emoji” (for inline custom emoji stickers)
    public var type: MessageEntityType

    /// Offset in UTF-16 code units to the start of the entity
    public var offset: Int

    /// Length of the entity in UTF-16 code units
    public var length: Int

    /// Optional. For “text\_link” only, URL that will be opened after user taps on the text
    public var url: String?

    /// Optional. For “text\_mention” only, the mentioned user
    public var user: User?

    /// Optional. For “pre” only, the programming language of the entity text
    public var language: String?

    /// Optional. For “custom\_emoji” only, unique identifier of the custom emoji. Use getCustomEmojiStickers to get full information about the sticker
    public var customEmojiID: String?

    public init(
        type: MessageEntityType,
        offset: Int,
        length: Int,
        url: String? = nil,
        user: User? = nil,
        language: String? = nil,
        customEmojiID: String? = nil
    ) {
        self.type = type
        self.offset = offset
        self.length = length
        self.url = url
        self.user = user
        self.language = language
        self.customEmojiID = customEmojiID
    }
}
