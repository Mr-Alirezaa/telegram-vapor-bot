import Foundation

/// Messages that are forwarded.
public class ForwarderFilter: Filter {
    public var name = "forwarded"

    override
    public func filter(message: Message) -> Bool {
        message.forwardDate != nil ||
            message.forwardFrom != nil ||
            message.forwardFromChat != nil ||
            message.forwardSignature != nil ||
            message.forwardFromMessageId != nil
    }
}

public extension Filter {
    static var forwarded: ForwarderFilter { ForwarderFilter() }
}
