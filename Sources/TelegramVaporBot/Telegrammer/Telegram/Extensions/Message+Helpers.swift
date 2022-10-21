import NIOCore

public extension Message {
    /// Helper method to easily reply to message
    ///
    /// - Parameters:
    ///    - bot: Bot in which reply is being sent
    ///    - text: Text of the reply to be sent, 1-4096 characters after entities parsing
    ///    - parseMode: Mode for parsing entities in the message text. See formatting options for more details.
    ///    - entities: A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse\_mode
    ///    - disableWebPagePreview: Disables link previews for links in this message
    ///    - disableNotification: Sends the message silently. Users will receive a notification with no sound.
    ///    - protectContent: Protects the contents of the sent message from forwarding and saving
    ///    - allowSendingWithoutReply: Pass True if the message should be sent even if the specified replied-to message is not found
    ///    - replyMarkup: Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    ///
    /// - Throws: Throws on errors
    /// - Returns: Returns an `EventLoopFuture` promising the result of `sendMessage` request as a `Message`
    @discardableResult
    func reply(
        using bot: BotProtocol,
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
    ///    - bot: Bot in which reply is being sent
    ///    - text: Text of the reply to be sent, 1-4096 characters after entities parsing
    ///    - parseMode: Mode for parsing entities in the message text. See formatting options for more details.
    ///    - entities: A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse\_mode
    ///    - disableWebPagePreview: Disables link previews for links in this message
    ///    - disableNotification: Sends the message silently. Users will receive a notification with no sound.
    ///    - protectContent: Protects the contents of the sent message from forwarding and saving
    ///    - allowSendingWithoutReply: Pass True if the message should be sent even if the specified replied-to message is not found
    ///    - replyMarkup: Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    ///
    /// - Throws: Throws on errors
    /// - Returns: Returns the result of `sendMessage` request as a `Message`
    @discardableResult
    func reply(
        using bot: BotProtocol,
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
            using: bot,
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

    /// Helper method to easily edit a message
    ///
    /// - Parameters:
    ///    - bot: Bot in which message is being edited
    ///    - text: New text of the message, 1-4096 characters after entities parsing
    ///    - parseMode: Mode for parsing entities in the message text. See formatting options for more details.
    ///    - replyMarkup: A JSON-serialized object for an inline keyboard.
    ///    - entities: A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse\_mode
    ///    - disableWebPagePreview: Disables link previews for links in this message
    ///
    /// - Throws: Throws on errors
    /// - Returns: An `EventLoopFuture` promising the result of editMessage request.
    @discardableResult
    func edit(
        using bot: BotProtocol,
        text: String,
        parseMode: ParseMode? = nil,
        entities: [MessageEntity]? = nil,
        disableWebPagePreview: Bool? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) throws -> EventLoopFuture<MessageOrBool> {
        let params = EditMessageTextParams(
            chatID: .chat(chat.id),
            messageID: messageID,
            inlineMessageID: nil,
            text: text,
            parseMode: parseMode,
            entities: entities,
            disableWebPagePreview: disableWebPagePreview,
            replyMarkup: replyMarkup
        )

        return try bot.editMessageText(params: params)
    }

    /// Helper method to easily edit a message
    ///
    /// - Parameters:
    ///    - bot: Bot in which message is being edited
    ///    - text: New text of the message, 1-4096 characters after entities parsing
    ///    - parseMode: Mode for parsing entities in the message text. See formatting options for more details.
    ///    - replyMarkup: A JSON-serialized object for an inline keyboard.
    ///    - entities: A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse\_mode
    ///    - disableWebPagePreview: Disables link previews for links in this message
    ///
    /// - Throws: Throws on errors
    /// - Returns: Result of editMessage request.
    @discardableResult
    func edit(
        using bot: BotProtocol,
        text: String,
        parseMode: ParseMode? = nil,
        entities: [MessageEntity]? = nil,
        disableWebPagePreview: Bool? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) async throws -> MessageOrBool {
        try await edit(
            using: bot,
            text: text,
            parseMode: parseMode,
            entities: entities,
            disableWebPagePreview: disableWebPagePreview,
            replyMarkup: replyMarkup
        )
        .get()
    }

    /// Helper method to easily delete message
    ///
    /// - Parameters:
    ///    - bot: Bot from which message is being deleted
    ///
    /// - Throws: Throws on errors
    /// - Returns: An `EventLoopFuture` promising the result of the deleteMessage request
    @discardableResult
    func delete(using bot: BotProtocol) throws -> EventLoopFuture<Bool> {
        let params = DeleteMessageParams(chatID: .chat(chat.id), messageID: messageID)

        return try bot.deleteMessage(params: params)
    }

    /// Helper method to easily delete message
    ///
    /// - Parameters:
    ///    - bot: Bot from which message is being deleted
    ///
    /// - Throws: Throws on errors
    /// - Returns: Result of deleteMessage request
    @discardableResult
    func delete(using bot: BotProtocol) async throws -> Bool {
        try await delete(using: bot).get()
    }

    /// Use this method to forward messages of any kind. Service messages can't be forwarded. On success, the sent Message is returned.
    ///
    /// - Parameters:
    ///   - chatID: Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    ///   - disableNotification: Sends the message silently. Users will receive a notification with no sound.
    ///   - protectContent: Protects the contents of the forwarded message from forwarding and saving.
    ///
    /// - Returns: The send `Message` if succeeds
    @discardableResult
    func forward(
        using bot: BotProtocol,
        to chatID: ChatID,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil
    ) throws -> EventLoopFuture<Message> {
        let params = ForwardMessageParams(
            chatID: chatID,
            fromChatID: .chat(chat.id),
            disableNotification: disableNotification,
            protectContent: protectContent,
            messageID: messageID
        )

        return try bot.forwardMessage(params: params)
    }

    /// Use this method to forward messages of any kind. Service messages can't be forwarded. On success, the sent Message is returned.
    ///
    /// - Parameters:
    ///   - chatID: Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    ///   - disableNotification: Sends the message silently. Users will receive a notification with no sound.
    ///   - protectContent: Protects the contents of the forwarded message from forwarding and saving.
    ///
    /// - Returns: The send `Message` if succeeds
    @discardableResult
    func forward(
        using bot: BotProtocol,
        to chatID: ChatID,
        disableNotification: Bool?,
        protectContent: Bool?
    ) async throws -> Message {
        try await forward(
            using: bot,
            to: chatID,
            disableNotification: disableNotification,
            protectContent: protectContent
        )
        .get()
    }

    /// Checks whether a message contains the specified command.
    ///
    /// - Parameter command: The command to check
    /// - Returns: True if the message text contains the command
    func contains(command: String) -> Bool {
        guard let text = text?.utf16, let entities = entities else { return false }
        let commands = entities.compactMap { entity -> String? in
            guard entity.type == .botCommand else { return nil }
            let start = text.index(text.startIndex, offsetBy: entity.offset)
            let end = text.index(start, offsetBy: entity.length - 1)
            let cmd = String(text[start ... end])
            return cmd == command ? cmd : nil
        }
        return !commands.isEmpty
    }
}
