import Foundation

/// Filters messages that contains a `SuccessfulPayment`.
public class SuccesfulPaymentFilter: Filter {
    public var name = "successful_payment"

    override
    public func filter(message: Message) -> Bool {
        message.successfulPayment != nil
    }
}

public extension Filter {
    static var successfulPayment: SuccesfulPaymentFilter { SuccesfulPaymentFilter() }
}
