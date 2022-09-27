import Vapor

/// DESCRIPTION:
/// Use this method to get information about custom emoji stickers by their identifiers. Returns an Array of Sticker objects.

/// Parameters container struct for `getCustomEmojiStickers` method
public struct GetCustomEmojiStickersParams: Encodable {
    /// List of custom emoji identifiers. At most 200 custom emoji identifiers can be specified.
    public var customEmojiIds: [String]

    /// Custom keys for coding/decoding `GetCustomEmojiStickersParams` struct
    public enum CodingKeys: String, CodingKey {
        case customEmojiIds = "custom_emoji_ids"
    }

    public init(customEmojiIds: [String]) {
        self.customEmojiIds = customEmojiIds
    }
}

public extension Bot {
    /**
     Use this method to get information about custom emoji stickers by their identifiers. Returns an Array of Sticker objects.

     SeeAlso Telegram Bot API Reference:
     [GetCustomEmojiStickersParams](https://core.telegram.org/bots/api#getcustomemojistickers)

     - Parameters:
         - params: Parameters container, see `GetCustomEmojiStickersParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `[Sticker]` type
     */
    @discardableResult
    func getCustomEmojiStickers(params: GetCustomEmojiStickersParams) throws -> EventLoopFuture<[Sticker]> {
        let methodURL: URI = .init(string: getMethodURL("getCustomEmojiStickers"))
        let future: EventLoopFuture<[Sticker]> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
