import Foundation

/// This enum represents the content of a media message to be sent.
public enum InputMedia: Encodable {
    case inputMediaPhoto(InputMediaPhoto)
    case inputMediaVideo(InputMediaVideo)
    case inputMediaAnimation(InputMediaAnimation)
    case inputMediaAudio(InputMediaAudio)
    case inputMediaDocument(InputMediaDocument)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .inputMediaPhoto(value):
            try container.encode(value)
        case let .inputMediaVideo(value):
            try container.encode(value)
        case let .inputMediaAnimation(value):
            try container.encode(value)
        case let .inputMediaAudio(value):
            try container.encode(value)
        case let .inputMediaDocument(value):
            try container.encode(value)
        }
    }
}

// public enum InputMediaPhotoAndVideo: Encodable {
//    case inputMediaPhoto(InputMediaPhoto)
//    case inputMediaVideo(InputMediaVideo)
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .inputMediaPhoto(let value):
//            try container.encode(value)
//        case .inputMediaVideo(let value):
//            try container.encode(value)
//        }
//    }
// }
