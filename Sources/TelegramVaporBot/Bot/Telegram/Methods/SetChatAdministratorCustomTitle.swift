import Vapor

/// Parameters container struct for `setChatAdministratorCustomTitle` method
public struct SetChatAdministratorCustomTitleParams: Encodable {
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatID: ChatID

    /// Unique identifier of the target user
    public var userID: Int64

    /// New custom title for the administrator; 0-16 characters, emoji are not allowed
    public var customTitle: String

    /// Custom keys for coding/decoding `SetChatAdministratorCustomTitleParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case userID = "user_id"
        case customTitle = "custom_title"
    }

    public init(chatID: ChatID, userID: Int64, customTitle: String) {
        self.chatID = chatID
        self.userID = userID
        self.customTitle = customTitle
    }
}

public extension Bot {
    /// Use this method to set a custom title for an administrator in a supergroup promoted by the bot. Returns True on success.

    /// SeeAlso Telegram Bot API Reference:
    /// [SetChatAdministratorCustomTitleParams](https://core.telegram.org/bots/api#setchatadministratorcustomtitle)

    /// - Parameters:
    ///     - params: Parameters container, see `SetChatAdministratorCustomTitleParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func setChatAdministratorCustomTitle(params: SetChatAdministratorCustomTitleParams) throws
        -> EventLoopFuture<Bool>
    {
        let methodURL: URI = .init(string: getMethodURL("setChatAdministratorCustomTitle"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
