//
//
//

//

import Foundation

/// Messages that contain `Contact`
public class ContactFilter: Filter {

    public var name: String = "contact"

    override
    public func filter(message: Message) -> Bool {
        return message.contact != nil
    }
}

public extension Filter {
    static var contact: ContactFilter { ContactFilter() }
}
