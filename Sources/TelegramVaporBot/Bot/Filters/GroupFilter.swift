import Foundation

/// Messages sent in a group chat
public class GroupFilter: Filter {
    public var name = "group"

    override
    public func filter(message: Message) -> Bool {
        message.chat.type != .private
    }
}

public extension Filter {
    static var group: GroupFilter { GroupFilter() }
}
