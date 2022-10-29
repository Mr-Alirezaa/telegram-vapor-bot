import Vapor

/// Parameters container struct for `getChat` method
public struct GetChatParams: Encodable {
    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatID: ChatID

    /// Custom keys for coding/decoding `GetChatParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
    }

    public init(chatID: ChatID) {
        self.chatID = chatID
    }
}

public extension Bot {
    /// Use this method to get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Returns a Chat object on success.

    /// SeeAlso Telegram Bot API Reference:
    /// [GetChatParams](https://core.telegram.org/bots/api#getchat)

    /// - Parameters:
    ///     - params: Parameters container, see `GetChatParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Chat` type
    @discardableResult func getChat(params: GetChatParams) throws -> EventLoopFuture<Chat> {
        let methodURL: URI = .init(string: getMethodURL("getChat"))
        let future: EventLoopFuture<Chat> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
