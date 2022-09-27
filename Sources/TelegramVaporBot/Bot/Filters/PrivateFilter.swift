import Foundation

/// Messages sent in a private chat
public class PrivateFilter: Filter {
    public var name = "private"

    override
    public func filter(message: Message) -> Bool {
        message.chat.type == .private
    }
}

public extension Filter {
    static var `private`: PrivateFilter { PrivateFilter() }
}
