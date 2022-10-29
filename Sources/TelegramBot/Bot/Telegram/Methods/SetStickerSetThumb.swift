import Vapor

/// Parameters container struct for `setStickerSetThumb` method
public struct SetStickerSetThumbParams: Encodable {
    /// Sticker set name
    public var name: String

    /// User identifier of the sticker set owner
    public var userID: Int64

    /// A PNG image with the thumbnail, must be up to 128 kilobytes in size and have width and height exactly 100px, or a S animation with the thumbnail up to 32 kilobytes in size; see https://core.telegram.org/stickers#animated-sticker-requirements for animated sticker technical requirements, or a WEBM video with the thumbnail up to 32 kilobytes in size; see https://core.telegram.org/stickers#video-sticker-requirements for video sticker technical requirements. Pass a file\_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files ». Animated sticker set thumbnails can't be uploaded via HTTP URL.
    public var thumb: FileInfo?

    /// Custom keys for coding/decoding `SetStickerSetThumbParams` struct
    public enum CodingKeys: String, CodingKey {
        case name
        case userID = "user_id"
        case thumb
    }

    public init(name: String, userID: Int64, thumb: FileInfo? = nil) {
        self.name = name
        self.userID = userID
        self.thumb = thumb
    }
}

public extension Bot {
    /// Use this method to set the thumbnail of a sticker set. Animated thumbnails can be set for animated sticker sets only. Video thumbnails can be set only for video sticker sets only. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SetStickerSetThumbParams](https://core.telegram.org/bots/api#setstickersetthumb)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SetStickerSetThumbParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func setStickerSetThumb(params: SetStickerSetThumbParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("setStickerSetThumb"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
