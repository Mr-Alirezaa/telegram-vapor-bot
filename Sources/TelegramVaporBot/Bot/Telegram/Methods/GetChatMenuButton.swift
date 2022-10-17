import Vapor

/// Parameters container struct for `getChatMenuButton` method
public struct GetChatMenuButtonParams: Encodable {
    /// Unique identifier for the target private chat. If not specified, default bot's menu button will be returned
    public var chatID: Int64?

    /// Custom keys for coding/decoding `GetChatMenuButtonParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
    }

    public init(chatID: Int64? = nil) {
        self.chatID = chatID
    }
}

public extension Bot {
    /// Use this method to get the current value of the bot's menu button in a private chat, or the default menu button. Returns MenuButton on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [GetChatMenuButtonParams](https://core.telegram.org/bots/api#getchatmenubutton)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `GetChatMenuButtonParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `MenuButton` type
    @discardableResult func getChatMenuButton(params: GetChatMenuButtonParams? = nil) throws
        -> EventLoopFuture<MenuButton>
    {
        let methodURL: URI = .init(string: getMethodURL("getChatMenuButton"))
        let future: EventLoopFuture<MenuButton> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
