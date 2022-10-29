import Vapor

public extension Bot {
    /// Use this method to get current webhook status. Requires no parameters. On success, returns a WebhookInfo object. If the bot is using getUpdates, will return an object with the url field empty.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [GetWebhookInfoParams](https://core.telegram.org/bots/api#getwebhookinfo)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `GetWebhookInfoParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `WebhookInfo` type
    @discardableResult func getWebhookInfo() throws -> EventLoopFuture<WebhookInfo> {
        let methodURL: URI = .init(string: getMethodURL("getWebhookInfo"))
        let future: EventLoopFuture<WebhookInfo> = tgClient.post(methodURL)
        return future
    }
}
