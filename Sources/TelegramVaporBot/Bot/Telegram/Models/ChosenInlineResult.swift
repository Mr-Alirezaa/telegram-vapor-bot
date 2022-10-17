
/// Represents a result of an inline query that was chosen by the user and sent to their chat partner.
///
/// SeeAlso Telegram Bot API Reference:
/// [ChosenInlineResult](https://core.telegram.org/bots/api#choseninlineresult)
public final class ChosenInlineResult: Codable {
    /// Custom keys for coding/decoding `ChosenInlineResult` struct
    public enum CodingKeys: String, CodingKey {
        case resultID = "result_id"
        case from
        case location
        case inlineMessageID = "inline_message_id"
        case query
    }

    /// The unique identifier for the result that was chosen
    public var resultID: String

    /// The user that chose the result
    public var from: User

    /// Optional. Sender location, only for bots that require user location
    public var location: Location?

    /// Optional. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.
    public var inlineMessageID: String?

    /// The query that was used to obtain the result
    public var query: String

    public init(
        resultID: String,
        from: User,
        location: Location? = nil,
        inlineMessageID: String? = nil,
        query: String
    ) {
        self.resultID = resultID
        self.from = from
        self.location = location
        self.inlineMessageID = inlineMessageID
        self.query = query
    }
}
