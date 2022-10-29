
/// This object contains basic information about a successful payment.
///
/// SeeAlso Telegram Bot API Reference:
/// [SuccessfulPayment](https://core.telegram.org/bots/api#successfulpayment)
public final class SuccessfulPayment: Codable {
    /// Custom keys for coding/decoding `SuccessfulPayment` struct
    public enum CodingKeys: String, CodingKey {
        case currency
        case totalAmount = "total_amount"
        case invoicePayload = "invoice_payload"
        case shippingOptionID = "shipping_option_id"
        case orderInfo = "order_info"
        case telegramPaymentChargeID = "telegram_payment_charge_id"
        case providerPaymentChargeID = "provider_payment_charge_id"
    }

    /// Three-letter ISO 4217 currency code
    public var currency: String

    /// Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    public var totalAmount: Int

    /// Bot specified invoice payload
    public var invoicePayload: String

    /// Optional. Identifier of the shipping option chosen by the user
    public var shippingOptionID: String?

    /// Optional. Order information provided by the user
    public var orderInfo: OrderInfo?

    /// Telegram payment identifier
    public var telegramPaymentChargeID: String

    /// Provider payment identifier
    public var providerPaymentChargeID: String

    public init(
        currency: String,
        totalAmount: Int,
        invoicePayload: String,
        shippingOptionID: String? = nil,
        orderInfo: OrderInfo? = nil,
        telegramPaymentChargeID: String,
        providerPaymentChargeID: String
    ) {
        self.currency = currency
        self.totalAmount = totalAmount
        self.invoicePayload = invoicePayload
        self.shippingOptionID = shippingOptionID
        self.orderInfo = orderInfo
        self.telegramPaymentChargeID = telegramPaymentChargeID
        self.providerPaymentChargeID = providerPaymentChargeID
    }
}
