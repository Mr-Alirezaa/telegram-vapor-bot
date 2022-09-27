//
//
//

//

import Foundation

/// Messages sent in a group chat
public class GroupFilter: Filter {

    public var name: String = "group"

    override
    public func filter(message: Message) -> Bool {
        return message.chat.type != .private
    }
}

public extension Filter {
    static var group: GroupFilter { GroupFilter() }
}
