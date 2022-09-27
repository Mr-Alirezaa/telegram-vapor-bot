//
//
//

//

import Foundation

/// Filters messages to allow only those which contains text
public class TextFilter: Filter {

    public var name: String = "text"
    private var value: String? = nil

    override
    public func filter(message: Message) -> Bool {
        guard let text = message.text else { return false }
        if let value = value {
            return text == value
        }
        return !text.isEmpty
    }

    public func value(_ value: String) -> Self {
        self.value = value
        return self
    }
}

public extension Filter {
    static var text: TextFilter { TextFilter() }
}
