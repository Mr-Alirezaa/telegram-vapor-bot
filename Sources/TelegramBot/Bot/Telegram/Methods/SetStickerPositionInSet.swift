import Vapor

/// Parameters container struct for `setStickerPositionInSet` method
public struct SetStickerPositionInSetParams: Encodable {
    /// File identifier of the sticker
    public var sticker: String

    /// New sticker position in the set, zero-based
    public var position: Int

    /// Custom keys for coding/decoding `SetStickerPositionInSetParams` struct
    public enum CodingKeys: String, CodingKey {
        case sticker
        case position
    }

    public init(sticker: String, position: Int) {
        self.sticker = sticker
        self.position = position
    }
}

public extension Bot {
    /// Use this method to move a sticker in a set created by the bot to a specific position. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SetStickerPositionInSetParams](https://core.telegram.org/bots/api#setstickerpositioninset)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SetStickerPositionInSetParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func setStickerPositionInSet(params: SetStickerPositionInSetParams) throws
        -> EventLoopFuture<Bool>
    {
        let methodURL: URI = .init(string: getMethodURL("setStickerPositionInSet"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
