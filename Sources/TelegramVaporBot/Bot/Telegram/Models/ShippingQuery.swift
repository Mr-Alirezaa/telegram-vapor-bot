
/// This object contains information about an incoming shipping query.
///
/// SeeAlso Telegram Bot API Reference:
/// [ShippingQuery](https://core.telegram.org/bots/api#shippingquery)
public final class ShippingQuery: Codable {
    /// Custom keys for coding/decoding `ShippingQuery` struct
    public enum CodingKeys: String, CodingKey {
        case id
        case from
        case invoicePayload = "invoice_payload"
        case shippingAddress = "shipping_address"
    }

    /// Unique query identifier
    public var id: String

    /// User who sent the query
    public var from: User

    /// Bot specified invoice payload
    public var invoicePayload: String

    /// User specified shipping address
    public var shippingAddress: ShippingAddress

    public init(id: String, from: User, invoicePayload: String, shippingAddress: ShippingAddress) {
        self.id = id
        self.from = from
        self.invoicePayload = invoicePayload
        self.shippingAddress = shippingAddress
    }
}
