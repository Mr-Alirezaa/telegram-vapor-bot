import Vapor

/// Parameters container struct for `stopMessageLiveLocation` method
public struct StopMessageLiveLocationParams: Encodable {
    /// Required if inline\_message\_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID?

    /// Required if inline\_message\_id is not specified. Identifier of the message with live location to stop
    public var messageID: Int?

    /// Required if chat\_id and message\_id are not specified. Identifier of the inline message
    public var inlineMessageID: String?

    /// A JSON-serialized object for a new inline keyboard.
    public var replyMarkup: InlineKeyboardMarkup?

    /// Custom keys for coding/decoding `StopMessageLiveLocationParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case messageID = "message_id"
        case inlineMessageID = "inline_message_id"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID? = nil,
        messageID: Int? = nil,
        inlineMessageID: String? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) {
        self.chatID = chatID
        self.messageID = messageID
        self.inlineMessageID = inlineMessageID
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to stop updating a live location message before live\_period expires. On success, if the message is not an inline message, the edited Message is returned, otherwise True is returned.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [StopMessageLiveLocationParams](https://core.telegram.org/bots/api#stopmessagelivelocation)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `StopMessageLiveLocationParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `MessageOrBool` type
    @discardableResult func stopMessageLiveLocation(params: StopMessageLiveLocationParams? = nil) throws
        -> EventLoopFuture<MessageOrBool>
    {
        let methodURL: URI = .init(string: getMethodURL("stopMessageLiveLocation"))
        let future: EventLoopFuture<MessageOrBool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
