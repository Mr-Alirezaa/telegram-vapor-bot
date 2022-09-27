import Foundation

/// Type of the entity. Can be mention (@username), hashtag, bot_command, url, email, bold (bold text), italic (italic text), code (monowidth string), pre (monowidth block), text_link (for clickable text URLs), text_mention (for users without usernames)
public enum MessageEntityType: String, Codable {
    case mention
    case hashtag
    case botCommand = "bot_command"
    case url
    case email
    case bold
    case italic
    case code
    case pre
    case textLink = "text_link"
    case textMention = "text_mention"
    case phoneNumber = "phone_number"
    case cashtag
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = MessageEntityType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}
