import Foundation

/// Messages that are a reply to another message
public class ReplyFilter: Filter {
    public var name = "reply"

    override
    public func filter(message: Message) -> Bool {
        message.replyToMessage != nil
    }
}

public extension Filter {
    static var reply: ReplyFilter { ReplyFilter() }
}
