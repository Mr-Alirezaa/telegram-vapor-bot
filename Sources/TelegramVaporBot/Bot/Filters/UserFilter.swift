import Foundation

/// Filters messages to allow only those which are from specified user ID.
public class UserFilter: Filter {
    var userIDs: Set<Int64>?
    var usernames: Set<String>?

    /// Init filter with user id
    public init(userID: Int64) {
        self.userIDs = Set<Int64>([userID])
        super.init()
    }

    /// Init filter which username to allow through.
    ///
    /// - note: Which username to allow through. If username starts with ‘@’ symbol, it will be ignored.
    public init(username: String) {
        self.usernames = Set<String>([username])
        super.init()
    }

    /// Init filter with user ids
    public init(userIDs: [Int64]) {
        self.userIDs = Set(userIDs)
        super.init()
    }

    /// Init filter which usernames to allow through.
    ///
    /// - note: If username starts with ‘@’ symbol, it will be ignored.
    public init(usernames: [String]) {
        self.usernames = Set(usernames)
        super.init()
    }

    /// Init filter with user id or user name
    ///
    /// - note: If username starts with ‘@’ symbol, it will be ignored.
    public init(userIDs: [Int64], usernames: [String]) {
        self.userIDs = Set(userIDs)
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

        if let ids = userIDs,
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
    static func user(userID: Int64) -> UserFilter {
        UserFilter(userID: userID)
    }

    static func user(username: String) -> UserFilter {
        UserFilter(username: username)
    }

    static func user(userIDs: [Int64]) -> UserFilter {
        UserFilter(userIDs: userIDs)
    }

    static func user(usernames: [String]) -> UserFilter {
        UserFilter(usernames: usernames)
    }

    static func user(userIDs: [Int64], usernames: [String]) -> UserFilter {
        UserFilter(userIDs: userIDs, usernames: usernames)
    }
}
