//
//
//

//

import Foundation

/// Filters messages to allow only those which are from specified chat ID.
public class ChatFilter: Filter {

    var chatId: Int64
    var username: String?

    public init(chatId: Int64, username: String? = nil) {
        self.chatId = chatId
        self.username = username
        super.init()
    }

    public var name: String = "chat"

    override
    public func filter(message: Message) -> Bool {
        guard message.chat.id == chatId else { return false }
        guard let desiredUsername = username else { return true }
        guard let incomingUsername = message.chat.username else { return true }
        return desiredUsername == incomingUsername
    }
}

public extension Filter {
    static func chat(chatId: Int64, username: String? = nil) -> ChatFilter {
        return ChatFilter(chatId: chatId, username: username)
    }
}
