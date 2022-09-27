import Vapor

/// DESCRIPTION:
/// Use this method to get a list of administrators in a chat, which aren't bots. Returns an Array of ChatMember objects.

/// Parameters container struct for `getChatAdministrators` method
public struct GetChatAdministratorsParams: Encodable {
    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    public var chatId: ChatId

    /// Custom keys for coding/decoding `GetChatAdministratorsParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatId = "chat_id"
    }

    public init(chatId: ChatId) {
        self.chatId = chatId
    }
}

public extension Bot {
    /**
     Use this method to get a list of administrators in a chat, which aren't bots. Returns an Array of ChatMember objects.

     SeeAlso Telegram Bot API Reference:
     [GetChatAdministratorsParams](https://core.telegram.org/bots/api#getchatadministrators)

     - Parameters:
         - params: Parameters container, see `GetChatAdministratorsParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `[ChatMember]` type
     */
    @discardableResult
    func getChatAdministrators(params: GetChatAdministratorsParams) throws -> EventLoopFuture<[ChatMember]> {
        let methodURL: URI = .init(string: getMethodURL("getChatAdministrators"))
        let future: EventLoopFuture<[ChatMember]> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
