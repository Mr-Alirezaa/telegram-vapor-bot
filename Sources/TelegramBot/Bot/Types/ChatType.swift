import Foundation

/// Type of chat, can be either “private”, “group”, “supergroup” or “channel”
public enum ChatType: String, Codable {
    case `private`
    case group
    case supergroup
    case channel
    case undefined

    public init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(String.self)
        guard let type = ChatType(rawValue: value) else {
            self = .undefined
            return
        }
        self = type
    }
}
