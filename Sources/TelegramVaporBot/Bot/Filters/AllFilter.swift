//
//
//

//

import Foundation

/// Filter for any update, said "no filter"
public class AllFilter: Filter {
    public var name: String = "all"

    override
    public func filter(message: Message) -> Bool {
        return true
    }
}

public extension Filter {
    static var all: AllFilter { AllFilter() }
}
