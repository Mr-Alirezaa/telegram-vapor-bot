import NIOCore

public extension CallbackQuery {
    /// Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.
    ///
    /// - Parameters:
    ///   - bot: `Bot` in which the callback query is being answered.
    ///   - text: Text of the notification. If not specified, nothing will be shown to the user, 0-200 characters
    ///   - showAlert: If True, an alert will be shown by the client instead of a notification at the top of the chat screen. Defaults to false.
    ///   - url: URL that will be opened by the user's client. If you have created a Game and accepted the conditions via @BotFather, specify the URL that opens your game - note that this will only work if the query comes from a callback\_game button. Otherwise, you may use links like t.me/your\_bot?start=XXXX that open your bot with a parameter.
    ///   - cacheTime: The maximum amount of time in seconds that the result of the callback query may be cached client-side. Telegram apps will support caching starting in version 3.14. Defaults to 0.
    ///
    /// - Returns: An `EventLoopFuture` promising True if succeeds.
    @discardableResult
    func answer(
        with bot: BotProtocol,
        text: String? = nil,
        showAlert: Bool? = nil,
        url: String? = nil,
        cacheTime: Int? = nil
    ) throws -> EventLoopFuture<Bool> {
        let params = AnswerCallbackQueryParams(
            callbackQueryID: id,
            text: text,
            showAlert: showAlert,
            url: url,
            cacheTime: cacheTime
        )

        return try bot.answerCallbackQuery(params: params)
    }

    /// Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned.
    ///
    /// - Parameters:
    ///   - bot: `Bot` in which the callback query is being answered.
    ///   - text: Text of the notification. If not specified, nothing will be shown to the user, 0-200 characters
    ///   - showAlert: If True, an alert will be shown by the client instead of a notification at the top of the chat screen. Defaults to false.
    ///   - url: URL that will be opened by the user's client. If you have created a Game and accepted the conditions via @BotFather, specify the URL that opens your game - note that this will only work if the query comes from a callback\_game button. Otherwise, you may use links like t.me/your\_bot?start=XXXX that open your bot with a parameter.
    ///   - cacheTime: The maximum amount of time in seconds that the result of the callback query may be cached client-side. Telegram apps will support caching starting in version 3.14. Defaults to 0.
    ///
    /// - Returns: True if succeeds.
    @discardableResult
    func answer(
        with bot: BotProtocol,
        text: String? = nil,
        showAlert: Bool? = nil,
        url: String? = nil,
        cacheTime: Int? = nil
    ) async throws -> Bool {
        try await answer(with: bot, text: text, showAlert: showAlert, url: url, cacheTime: cacheTime).get()
    }
}

