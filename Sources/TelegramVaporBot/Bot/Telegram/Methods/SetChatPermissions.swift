import Vapor

/// Parameters container struct for `setChatPermissions` method
public struct SetChatPermissionsParams: Encodable {
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatID: ChatID

    /// A JSON-serialized object for new default chat permissions
    public var permissions: ChatPermissions

    /// Custom keys for coding/decoding `SetChatPermissionsParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case permissions
    }

    public init(chatID: ChatID, permissions: ChatPermissions) {
        self.chatID = chatID
        self.permissions = permissions
    }
}

public extension Bot {
    /// Use this method to set default chat permissions for all members. The bot must be an administrator in the group or a supergroup for this to work and must have the can\_restrict\_members administrator rights. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SetChatPermissionsParams](https://core.telegram.org/bots/api#setchatpermissions)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SetChatPermissionsParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func setChatPermissions(params: SetChatPermissionsParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("setChatPermissions"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
