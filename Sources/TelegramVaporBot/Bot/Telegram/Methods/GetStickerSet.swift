

import Vapor

/// DESCRIPTION:
/// Use this method to get a sticker set. On success, a StickerSet object is returned.


/// Parameters container struct for `getStickerSet` method
public struct GetStickerSetParams: Encodable {

    /// Name of the sticker set
    public var name: String

    /// Custom keys for coding/decoding `GetStickerSetParams` struct
    public enum CodingKeys: String, CodingKey {
            case name = "name"
    }

    public init(name: String) {
            self.name = name
    }
}


public extension Bot {

/**
 Use this method to get a sticker set. On success, a StickerSet object is returned.

 SeeAlso Telegram Bot API Reference:
 [GetStickerSetParams](https://core.telegram.org/bots/api#getstickerset)
 
 - Parameters:
     - params: Parameters container, see `GetStickerSetParams` struct
 - Throws: Throws on errors
 - Returns: EventLoopFuture of `StickerSet` type
 */
    @discardableResult
    func getStickerSet(params: GetStickerSetParams) throws -> EventLoopFuture<StickerSet> {
        let methodURL: URI = .init(string: getMethodURL("getStickerSet"))
        let future: EventLoopFuture<StickerSet> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
