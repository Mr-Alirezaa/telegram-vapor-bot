import Foundation

/// Messages that contain `Vanue`
public class VenueFilter: Filter {
    public var name = "venue"

    override
    public func filter(message: Message) -> Bool {
        message.venue != nil
    }
}

public extension Filter {
    static var venue: VenueFilter { VenueFilter() }
}
