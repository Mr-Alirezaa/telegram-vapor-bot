import NIOCore

public extension Message {
    /// Helper method to easily reply to message
    ///
    /// - Parameters:
    ///   - bot: Bot in which reply is being sent
    ///   - text: Text of the reply to be sent, 1-4096 characters after entities parsing
    ///   - parseMode: Mode for parsing entities in the message text. See formatting options for more details.
    ///   - entities: A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse\_mode
    ///   - disableWebPagePreview: Disables link previews for links in this message
    ///   - disableNotification: Sends the message silently. Users will receive a notification with no sound.
    ///   - protectContent: Protects the contents of the sent message from forwarding and saving
    ///   - allowSendingWithoutReply: Pass True if the message should be sent even if the specified replied-to message is not found
    ///   - replyMarkup: Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    ///
    /// - Throws: Throws on errors
    /// - Returns: Returns an `EventLoopFuture` promising the result of `sendMessage` request as a `Message`
    @discardableResult
    func reply(
        with bot: BotProtocol,
        text: String,
        parseMode: ParseMode? = nil,
        entities: [MessageEntity]? = nil,
        disableWebPagePreview: Bool? = nil,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) throws -> EventLoopFuture<Message> {
        let params = SendMessageParams(
            chatID: .chat(chat.id),
            text: text,
            parseMode: parseMode,
            entities: entities,
            disableWebPagePreview: disableWebPagePreview,
            disableNotification: disableNotification,
            protectContent: protectContent,
            replyToMessageID: messageID,
            allowSendingWithoutReply: allowSendingWithoutReply,
            replyMarkup: replyMarkup
        )

        return try bot.sendMessage(params: params)
    }

    /// Helper method to easily reply to message
    ///
    /// - Parameters:
    ///   - bot: Bot in which reply is being sent
    ///   - text: Text of the reply to be sent, 1-4096 characters after entities parsing
    ///   - parseMode: Mode for parsing entities in the message text. See formatting options for more details.
    ///   - entities: A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse\_mode
    ///   - disableWebPagePreview: Disables link previews for links in this message
    ///   - disableNotification: Sends the message silently. Users will receive a notification with no sound.
    ///   - protectContent: Protects the contents of the sent message from forwarding and saving
    ///   - allowSendingWithoutReply: Pass True if the message should be sent even if the specified replied-to message is not found
    ///   - replyMarkup: Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    ///
    /// - Throws: Throws on errors
    /// - Returns: Returns the result of `sendMessage` request as a `Message`
    @discardableResult
    func reply(
        with bot: BotProtocol,
        text: String,
        parseMode: ParseMode? = nil,
        entities: [MessageEntity]? = nil,
        disableWebPagePreview: Bool? = nil,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) async throws -> Message {
        try await reply(
            with: bot,
            text: text,
            parseMode: parseMode,
            entities: entities,
            disableWebPagePreview: disableWebPagePreview,
            disableNotification: disableNotification,
            protectContent: protectContent,
            allowSendingWithoutReply: allowSendingWithoutReply,
            replyMarkup: replyMarkup
        ).get()
    }
}
