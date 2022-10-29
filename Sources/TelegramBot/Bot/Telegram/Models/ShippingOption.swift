
/// This object represents one shipping option.
///
/// SeeAlso Telegram Bot API Reference:
/// [ShippingOption](https://core.telegram.org/bots/api#shippingoption)
public final class ShippingOption: Codable {
    /// Custom keys for coding/decoding `ShippingOption` struct
    public enum CodingKeys: String, CodingKey {
        case id
        case title
        case prices
    }

    /// Shipping option identifier
    public var id: String

    /// Option title
    public var title: String

    /// List of price portions
    public var prices: [LabeledPrice]

    public init(id: String, title: String, prices: [LabeledPrice]) {
        self.id = id
        self.title = title
        self.prices = prices
    }
}
