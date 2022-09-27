import Vapor

/// DESCRIPTION:
/// Use this method to stop updating a live location message before live_period expires. On success, if the message is not an inline message, the edited Message is returned, otherwise True is returned.

/// Parameters container struct for `stopMessageLiveLocation` method
public struct StopMessageLiveLocationParams: Encodable {
    /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: ChatId?

    /// Required if inline_message_id is not specified. Identifier of the message with live location to stop
    public var messageId: Int?

    /// Required if chat_id and message_id are not specified. Identifier of the inline message
    public var inlineMessageId: String?

    /// A JSON-serialized object for a new inline keyboard.
    public var replyMarkup: InlineKeyboardMarkup?

    /// Custom keys for coding/decoding `StopMessageLiveLocationParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatId = "chat_id"
        case messageId = "message_id"
        case inlineMessageId = "inline_message_id"
        case replyMarkup = "reply_markup"
    }

    public init(chatId: ChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, replyMarkup: InlineKeyboardMarkup? = nil) {
        self.chatId = chatId
        self.messageId = messageId
        self.inlineMessageId = inlineMessageId
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /**
     Use this method to stop updating a live location message before live_period expires. On success, if the message is not an inline message, the edited Message is returned, otherwise True is returned.

     SeeAlso Telegram Bot API Reference:
     [StopMessageLiveLocationParams](https://core.telegram.org/bots/api#stopmessagelivelocation)

     - Parameters:
         - params: Parameters container, see `StopMessageLiveLocationParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `MessageOrBool` type
     */
    @discardableResult
    func stopMessageLiveLocation(params: StopMessageLiveLocationParams? = nil) throws -> EventLoopFuture<MessageOrBool> {
        let methodURL: URI = .init(string: getMethodURL("stopMessageLiveLocation"))
        let future: EventLoopFuture<MessageOrBool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
