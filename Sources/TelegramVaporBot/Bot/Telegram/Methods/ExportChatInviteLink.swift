import Vapor

/// Parameters container struct for `exportChatInviteLink` method
public struct ExportChatInviteLinkParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Custom keys for coding/decoding `ExportChatInviteLinkParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
    }

    public init(chatID: ChatID) {
        self.chatID = chatID
    }
}

public extension Bot {
    /// Use this method to generate a new primary invite link for a chat; any previously generated primary link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns the new invite link as String on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [ExportChatInviteLinkParams](https://core.telegram.org/bots/api#exportchatinvitelink)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `ExportChatInviteLinkParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `String` type
    @discardableResult func exportChatInviteLink(params: ExportChatInviteLinkParams) throws -> EventLoopFuture<String> {
        let methodURL: URI = .init(string: getMethodURL("exportChatInviteLink"))
        let future: EventLoopFuture<String> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
