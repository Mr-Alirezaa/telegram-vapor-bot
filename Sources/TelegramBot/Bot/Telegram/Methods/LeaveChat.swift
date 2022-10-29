import Vapor

/// Parameters container struct for `leaveChat` method
public struct LeaveChatParams: Encodable {
    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatID: ChatID

    /// Custom keys for coding/decoding `LeaveChatParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
    }

    public init(chatID: ChatID) {
        self.chatID = chatID
    }
}

public extension Bot {
    /// Use this method for your bot to leave a group, supergroup or channel. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [LeaveChatParams](https://core.telegram.org/bots/api#leavechat)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `LeaveChatParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func leaveChat(params: LeaveChatParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("leaveChat"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
