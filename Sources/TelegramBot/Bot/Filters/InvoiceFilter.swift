import Foundation

/// Messages that contain `Invoice`
public class InvoiceFilter: Filter {
    public var name = "invoice"

    override
    public func filter(message: Message) -> Bool {
        message.invoice != nil
    }
}

public extension Filter {
    static var invoice: InvoiceFilter { InvoiceFilter() }
}
