import Vapor

/// Parameters container struct for `unbanChatSenderChat` method
public struct UnbanChatSenderChatParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Unique identifier of the target sender chat
    public var senderChatID: Int64

    /// Custom keys for coding/decoding `UnbanChatSenderChatParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case senderChatID = "sender_chat_id"
    }

    public init(chatID: ChatID, senderChatID: Int64) {
        self.chatID = chatID
        self.senderChatID = senderChatID
    }
}

public extension Bot {
    /// Use this method to unban a previously banned channel chat in a supergroup or channel. The bot must be an administrator for this to work and must have the appropriate administrator rights. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [UnbanChatSenderChatParams](https://core.telegram.org/bots/api#unbanchatsenderchat)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `UnbanChatSenderChatParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func unbanChatSenderChat(params: UnbanChatSenderChatParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("unbanChatSenderChat"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
