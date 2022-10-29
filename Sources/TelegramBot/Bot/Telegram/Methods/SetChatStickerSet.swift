import Vapor

/// Parameters container struct for `setChatStickerSet` method
public struct SetChatStickerSetParams: Encodable {
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatID: ChatID

    /// Name of the sticker set to be set as the group sticker set
    public var stickerSetName: String

    /// Custom keys for coding/decoding `SetChatStickerSetParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case stickerSetName = "sticker_set_name"
    }

    public init(chatID: ChatID, stickerSetName: String) {
        self.chatID = chatID
        self.stickerSetName = stickerSetName
    }
}

public extension Bot {
    /// Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can\_set\_sticker\_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SetChatStickerSetParams](https://core.telegram.org/bots/api#setchatstickerset)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SetChatStickerSetParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func setChatStickerSet(params: SetChatStickerSetParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("setChatStickerSet"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
