import Foundation

/// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
public enum ChatID: Codable {
    case chat(Int64)
    case username(String)
    case undefined

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .username(string):
            try container.encode(string)
        case let .chat(integer):
            try container.encode(integer)
        default:
            try container.encodeNil()
        }
    }

    public init(from decoder: Decoder) throws {
        if let value = try? decoder.singleValueContainer().decode(Int64.self) {
            self = .chat(value)
            return
        }
        if let value = try? decoder.singleValueContainer().decode(String.self) {
            self = .username(value)
            return
        }
        self = .undefined
    }
}
