//
//
//

//

import Foundation

/// Messages that contain `Location`
public class LocationFilter: Filter {

    public var name: String = "location"

    override
    public func filter(message: Message) -> Bool {
        return message.location != nil
    }
}

public extension Filter {
    static var location: LocationFilter { LocationFilter() }
}
