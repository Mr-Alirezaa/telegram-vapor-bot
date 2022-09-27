import Vapor

/// DESCRIPTION:
/// Use this method to get the number of members in a chat. Returns Int on success.

/// Parameters container struct for `getChatMemberCount` method
public struct GetChatMemberCountParams: Encodable {
    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatId: ChatId

    /// Custom keys for coding/decoding `GetChatMemberCountParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatId = "chat_id"
    }

    public init(chatId: ChatId) {
        self.chatId = chatId
    }
}

public extension Bot {
    /**
     Use this method to get the number of members in a chat. Returns Int on success.

     SeeAlso Telegram Bot API Reference:
     [GetChatMemberCountParams](https://core.telegram.org/bots/api#getchatmembercount)

     - Parameters:
         - params: Parameters container, see `GetChatMemberCountParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `Int` type
     */
    @discardableResult
    func getChatMemberCount(params: GetChatMemberCountParams) throws -> EventLoopFuture<Int> {
        let methodURL: URI = .init(string: getMethodURL("getChatMemberCount"))
        let future: EventLoopFuture<Int> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
