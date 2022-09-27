import Foundation

/// Filter for any update, said "no filter"
public class AllFilter: Filter {
    public var name = "all"

    override
    public func filter(message: Message) -> Bool {
        true
    }
}

public extension Filter {
    static var all: AllFilter { AllFilter() }
}
