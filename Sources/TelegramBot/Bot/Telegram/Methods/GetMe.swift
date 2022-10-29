import Vapor

public extension Bot {
    /// A simple method for testing your bot's authentication token. Requires no parameters. Returns basic information about the bot in form of a User object.

    /// SeeAlso Telegram Bot API Reference:
    /// [GetMeParams](https://core.telegram.org/bots/api#getme)

    /// - Parameters:
    ///     - params: Parameters container, see `GetMeParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `User` type
    @discardableResult func getMe() throws -> EventLoopFuture<User> {
        let methodURL: URI = .init(string: getMethodURL("getMe"))
        let future: EventLoopFuture<User> = tgClient.post(methodURL)
        return future
    }
}
