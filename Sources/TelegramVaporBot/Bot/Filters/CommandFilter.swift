//
//
//

//

import Foundation

/// Messages which contains command entity
public class CommandFilter: Filter {

    public var name: String = "command"

    private var _names: [String]? = nil
    public func names(_ names: [String]) -> Self {
        _names = names
        return self
    }

    override
    public func filter(message: Message) -> Bool {
        guard let entity = message.entities else { return false }
        if let names = _names {
            var trigger: Bool = false
            for name in names {
                if message.contains(command: name) {
                    trigger = true
                    break
                }
            }

            return entity.contains(where: { $0.type == .botCommand }) && trigger
        } else {
            return entity.contains(where: { $0.type == .botCommand })
        }
    }
}

public extension Filter {
    static var command: CommandFilter { CommandFilter() }
}
