//
//
//

//

import Foundation

/// Filters messages that contains a `SuccessfulPayment`.
public class SuccesfulPaymentFilter: Filter {

    public var name: String = "successful_payment"

    override
    public func filter(message: Message) -> Bool {
        return message.successfulPayment != nil
    }
}

public extension Filter {
    static var successfulPayment: SuccesfulPaymentFilter { SuccesfulPaymentFilter() }
}
