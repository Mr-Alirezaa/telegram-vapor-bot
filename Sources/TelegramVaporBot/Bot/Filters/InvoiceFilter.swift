//
//
//

//

import Foundation

/// Messages that contain `Invoice`
public class InvoiceFilter: Filter {

    public var name: String = "invoice"

    override
    public func filter(message: Message) -> Bool {
        return message.invoice != nil
    }
}

public extension Filter {
    static var invoice: InvoiceFilter { InvoiceFilter() }
}
