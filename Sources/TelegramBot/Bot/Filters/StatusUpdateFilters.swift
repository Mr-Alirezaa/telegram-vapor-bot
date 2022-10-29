import Foundation

/// Subset struct for messages containing a status update.
///
/// Use these filters like: `StatusUpdateFilters.newChatMembers` etc.
public struct StatusUpdateFilters {
    /// Messages that contain Message.groupChatCreated, Message.supergroupChatCreated or Message.channelChatCreated
    public static var chatCreated: ChatCreatedFilter { ChatCreatedFilter() }

    /// Messages that contain Message.deleteChatPhoto
    public static var deleteChatPhoto: DeleteChatPhotoFilter { DeleteChatPhotoFilter() }

    /// Messages that contain Message.leftChatMember
    public static var leftChatMember: LeftChatMemberFilter { LeftChatMemberFilter() }

    /// Messages that contain Message.migrateFromChatID
    public static var migrate: MigrateFilter { MigrateFilter() }

    /// Messages that contain Message.newChatMembers
    public static var newChatMembers: NewChatMembersFilter { NewChatMembersFilter() }

    /// Messages that contain Message.newChatPhoto
    public static var newChatPhoto: NewChatPhotoFilter { NewChatPhotoFilter() }

    /// Messages that contain Message.newChatTitle
    public static var newChatTitle: NewChatTitleFilter { NewChatTitleFilter() }

    /// Messages that contain Message.pinnedMessage
    public static var pinnedMessage: PinnedMessageFilter { PinnedMessageFilter() }
}

/// Messages that contain Message.groupChatCreated, Message.supergroupChatCreated or Message.channelChatCreated
public class ChatCreatedFilter: Filter {
    public var name = "chat_created"

    override
    public func filter(message: Message) -> Bool {
        message.channelChatCreated != nil ||
            message.supergroupChatCreated != nil ||
            message.channelChatCreated != nil
    }
}

/// Messages that contain Message.deleteChatPhoto
public class DeleteChatPhotoFilter: Filter {
    public var name = "delete_chat_photo"

    override
    public func filter(message: Message) -> Bool {
        message.deleteChatPhoto != nil
    }
}

/// Messages that contain Message.leftChatMember
public class LeftChatMemberFilter: Filter {
    public var name = "left_chat_member"

    override
    public func filter(message: Message) -> Bool {
        message.leftChatMember != nil
    }
}

/// Messages that contain Message.migrateFromChatID
public class MigrateFilter: Filter {
    public var name = "migrate"

    override
    public func filter(message: Message) -> Bool {
        message.migrateFromChatID != nil ||
            message.migrateToChatID != nil
    }
}

/// Messages that contain Message.newChatMembers
public class NewChatMembersFilter: Filter {
    public var name = "new_chat_members"

    override
    public func filter(message: Message) -> Bool {
        message.newChatMembers != nil
    }
}

/// Messages that contain Message.newChatPhoto
public class NewChatPhotoFilter: Filter {
    public var name = "new_chat_photo"

    override
    public func filter(message: Message) -> Bool {
        guard let photos = message.newChatPhoto else { return false }
        return !photos.isEmpty
    }
}

/// Messages that contain Message.newChatTitle
public class NewChatTitleFilter: Filter {
    public var name = "new_chat_title"

    override
    public func filter(message: Message) -> Bool {
        message.newChatTitle != nil
    }
}

/// Messages that contain Message.pinnedMessage
public class PinnedMessageFilter: Filter {
    public var name = "pinned_message"

    override
    public func filter(message: Message) -> Bool {
        message.pinnedMessage != nil
    }
}
