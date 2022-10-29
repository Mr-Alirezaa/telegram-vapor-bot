import Vapor

/// Parameters container struct for `getChatMember` method
public struct GetChatMemberParams: Encodable {
    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatID: ChatID

    /// Unique identifier of the target user
    public var userID: Int64

    /// Custom keys for coding/decoding `GetChatMemberParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case userID = "user_id"
    }

    public init(chatID: ChatID, userID: Int64) {
        self.chatID = chatID
        self.userID = userID
    }
}

public extension Bot {
    /// Use this method to get information about a member of a chat. Returns a ChatMember object on success.

    /// SeeAlso Telegram Bot API Reference:
    /// [GetChatMemberParams](https://core.telegram.org/bots/api#getchatmember)

    /// - Parameters:
    ///     - params: Parameters container, see `GetChatMemberParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `ChatMember` type
    @discardableResult func getChatMember(params: GetChatMemberParams) throws -> EventLoopFuture<ChatMember> {
        let methodURL: URI = .init(string: getMethodURL("getChatMember"))
        let future: EventLoopFuture<ChatMember> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
