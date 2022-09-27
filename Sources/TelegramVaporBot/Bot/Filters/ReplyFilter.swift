//
//
//

//

import Foundation

/// Messages that are a reply to another message
public class ReplyFilter: Filter {

    public var name: String = "reply"

    override
    public func filter(message: Message) -> Bool {
        return message.replyToMessage != nil
    }
}

public extension Filter {
    static var reply: ReplyFilter { ReplyFilter() }
}
