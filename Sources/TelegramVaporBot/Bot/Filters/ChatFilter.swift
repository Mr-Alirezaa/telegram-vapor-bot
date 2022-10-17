import Foundation

/// Filters messages to allow only those which are from specified chat ID.
public class ChatFilter: Filter {
    var chatID: Int64
    var username: String?

    public init(chatID: Int64, username: String? = nil) {
        self.chatID = chatID
        self.username = username
        super.init()
    }

    public var name = "chat"

    override
    public func filter(message: Message) -> Bool {
        guard message.chat.id == chatID else { return false }
        guard let desiredUsername = username else { return true }
        guard let incomingUsername = message.chat.username else { return true }
        return desiredUsername == incomingUsername
    }
}

public extension Filter {
    static func chat(chatID: Int64, username: String? = nil) -> ChatFilter {
        ChatFilter(chatID: chatID, username: username)
    }
}
