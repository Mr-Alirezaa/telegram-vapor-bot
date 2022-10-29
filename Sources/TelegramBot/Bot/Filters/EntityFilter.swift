import Foundation

/// Filters messages to only allow those which have a `MessageEntity` where their type matches `type`.
public class EntityFilter: Filter {
    let entityTypes: Set<MessageEntityType>

    public init(types: [MessageEntityType]) {
        self.entityTypes = Set(types)
        super.init()
    }

    public var name = "entity"

    override
    public func filter(message: Message) -> Bool {
        guard let entities = message.entities else { return false }
        let incomingTypes = entities.map(\.type)
        return !entityTypes.isDisjoint(with: incomingTypes)
    }
}

public extension Filter {
    static func entity(types: [MessageEntityType]) -> EntityFilter {
        EntityFilter(types: types)
    }
}
