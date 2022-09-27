//
//
//

//

import Foundation

/// Filters media messages to only allow those which have a `MessageEntity` where their type matches `type`.
public class CaptionEntityFilter: Filter {

    var entityType: MessageEntityType

    public init(type: MessageEntityType) {
        self.entityType = type
        super.init()
    }

    public var name: String = "caption_entity"

    override
    public func filter(message: Message) -> Bool {
        guard let entities = message.entities else { return false }
        return entities.contains(where: { (entity) -> Bool in
            return entity.type == entityType
        })
    }
}

public extension Filter {
    static func captionEntity(type: MessageEntityType) -> CaptionEntityFilter {
        return CaptionEntityFilter(type: type)
    }
}
