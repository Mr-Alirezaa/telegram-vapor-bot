import Foundation

/// Filters messages to allow only those which are from specified user ID.
public class UserFilter: Filter {
    var userIds: Set<Int64>?
    var usernames: Set<String>?

    /**
     Init filter with user id
     */
    public init(userId: Int64) {
        userIds = Set<Int64>([userId])
        super.init()
    }

    /**
      Init filter which username to allow through.

      Note: Which username to allow through. If username starts with ‘@’ symbol, it will be ignored.
     */
    public init(username: String) {
        usernames = Set<String>([username])
        super.init()
    }

    /**
     Init filter with user ids
     */
    public init(userIds: [Int64]) {
        self.userIds = Set(userIds)
        super.init()
    }

    /**
     Init filter which usernames to allow through.

     Note: If username starts with ‘@’ symbol, it will be ignored.
     */
    public init(usernames: [String]) {
        self.usernames = Set(usernames)
        super.init()
    }

    /**
     Init filter with user id or user name

     Note: If username starts with ‘@’ symbol, it will be ignored.
     */
    public init(userIds: [Int64], usernames: [String]) {
        self.userIds = Set(userIds)
        self.usernames = Set(usernames)
        super.init()
    }

//    required init(lhs: Filter, rhs: Filter, op: Operation) {
//        super.init(lhs: lhs, rhs: rhs, op: op)
//    }

    public var name = "user"

    override
    public func filter(message: Message) -> Bool {
        guard let user = message.from else { return false }

        if let ids = userIds,
           !ids.contains(user.id)
        {
            return false
        }

        if let names = usernames,
           let username = user.username,
           !names.contains(username)
        {
            return false
        }

        return true
    }
}

public extension Filter {
    static func user(userId: Int64) -> UserFilter {
        UserFilter(userId: userId)
    }

    static func user(username: String) -> UserFilter {
        UserFilter(username: username)
    }

    static func user(userIds: [Int64]) -> UserFilter {
        UserFilter(userIds: userIds)
    }

    static func user(usernames: [String]) -> UserFilter {
        UserFilter(usernames: usernames)
    }

    static func user(userIds: [Int64], usernames: [String]) -> UserFilter {
        UserFilter(userIds: userIds, usernames: usernames)
    }
}
