import Vapor

/// Parameters container struct for `editMessageLiveLocation` method
public struct EditMessageLiveLocationParams: Encodable {
    /// Required if inline\_message\_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID?

    /// Required if inline\_message\_id is not specified. Identifier of the message to edit
    public var messageID: Int?

    /// Required if chat\_id and message\_id are not specified. Identifier of the inline message
    public var inlineMessageID: String?

    /// Latitude of new location
    public var latitude: Float

    /// Longitude of new location
    public var longitude: Float

    /// The radius of uncertainty for the location, measured in meters; 0-1500
    public var horizontalAccuracy: Float?

    /// Direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    public var heading: Int?

    /// The maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    public var proximityAlertRadius: Int?

    /// A JSON-serialized object for a new inline keyboard.
    public var replyMarkup: InlineKeyboardMarkup?

    /// Custom keys for coding/decoding `EditMessageLiveLocationParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case messageID = "message_id"
        case inlineMessageID = "inline_message_id"
        case latitude
        case longitude
        case horizontalAccuracy = "horizontal_accuracy"
        case heading
        case proximityAlertRadius = "proximity_alert_radius"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID? = nil,
        messageID: Int? = nil,
        inlineMessageID: String? = nil,
        latitude: Float,
        longitude: Float,
        horizontalAccuracy: Float? = nil,
        heading: Int? = nil,
        proximityAlertRadius: Int? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) {
        self.chatID = chatID
        self.messageID = messageID
        self.inlineMessageID = inlineMessageID
        self.latitude = latitude
        self.longitude = longitude
        self.horizontalAccuracy = horizontalAccuracy
        self.heading = heading
        self.proximityAlertRadius = proximityAlertRadius
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to edit live location messages. A location can be edited until its live\_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [EditMessageLiveLocationParams](https://core.telegram.org/bots/api#editmessagelivelocation)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `EditMessageLiveLocationParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `MessageOrBool` type
    @discardableResult func editMessageLiveLocation(params: EditMessageLiveLocationParams) throws
        -> EventLoopFuture<MessageOrBool>
    {
        let methodURL: URI = .init(string: getMethodURL("editMessageLiveLocation"))
        let future: EventLoopFuture<MessageOrBool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
