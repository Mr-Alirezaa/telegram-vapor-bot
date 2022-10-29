import Vapor

/// Parameters container struct for `setChatTitle` method
public struct SetChatTitleParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// New chat title, 1-255 characters
    public var title: String

    /// Custom keys for coding/decoding `SetChatTitleParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case title
    }

    public init(chatID: ChatID, title: String) {
        self.chatID = chatID
        self.title = title
    }
}

public extension Bot {
    /// Use this method to change the title of a chat. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SetChatTitleParams](https://core.telegram.org/bots/api#setchattitle)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SetChatTitleParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func setChatTitle(params: SetChatTitleParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("setChatTitle"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
