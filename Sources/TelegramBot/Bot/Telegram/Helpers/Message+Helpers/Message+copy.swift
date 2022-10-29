import NIOCore

public extension Message {
    /// Use this helper method to copy messages of any kind. Service messages and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct\_option\_id is known to the bot. The method is analogous to the method forwardMessage, but the copied message doesn't have a link to the original message.
    ///
    /// - Parameters:
    ///   - chatID: Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    ///   - caption: New caption for media, 0-1024 characters after entities parsing. If not specified, the original caption is kept
    ///   - parseMode: Mode for parsing entities in the new caption. See formatting options for more details.
    ///   - captionEntities: A JSON-serialized list of special entities that appear in the new caption, which can be specified instead of parse_mode
    ///   - disableNotification: Sends the message silently. Users will receive a notification with no sound.
    ///   - protectContent: Protects the contents of the sent message from forwarding and saving
    ///   - replyToMessageID: If the message is a reply, ID of the original message
    ///   - allowSendingWithoutReply: Pass True if the message should be sent even if the specified replied-to message is not found
    ///   - replyMarkup: Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    ///
    /// - Returns: MessageID of the sent message on success.
    @discardableResult
    func copy(
        with bot: BotProtocol,
        to chatID: ChatID,
        caption: String? = nil,
        parseMode: ParseMode? = nil,
        captionEntities: [MessageEntity]? = nil,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        replyToMessageID: Int? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) throws -> EventLoopFuture<MessageID> {
        let params = CopyMessageParams(
            chatID: chatID,
            fromChatID: .chat(chat.id),
            messageID: messageID,
            caption: caption,
            parseMode: parseMode,
            captionEntities: captionEntities,
            disableNotification: disableNotification,
            protectContent: protectContent,
            replyToMessageID: replyToMessageID,
            allowSendingWithoutReply: allowSendingWithoutReply,
            replyMarkup: replyMarkup
        )

        return try bot.copyMessage(params: params)
    }

    /// Use this helper method to copy messages of any kind. Service messages and invoice messages can't be copied. A quiz poll can be copied only if the value of the field correct\_option\_id is known to the bot. The method is analogous to the method forwardMessage, but the copied message doesn't have a link to the original message.
    ///
    /// - Parameters:
    ///   - chatID: Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    ///   - caption: New caption for media, 0-1024 characters after entities parsing. If not specified, the original caption is kept
    ///   - parseMode: Mode for parsing entities in the new caption. See formatting options for more details.
    ///   - captionEntities: A JSON-serialized list of special entities that appear in the new caption, which can be specified instead of parse_mode
    ///   - disableNotification: Sends the message silently. Users will receive a notification with no sound.
    ///   - protectContent: Protects the contents of the sent message from forwarding and saving
    ///   - replyToMessageID: If the message is a reply, ID of the original message
    ///   - allowSendingWithoutReply: Pass True if the message should be sent even if the specified replied-to message is not found
    ///   - replyMarkup: Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    ///
    /// - Returns: MessageID of the sent message on success.
    @discardableResult
    func copy(
        with bot: BotProtocol,
        to chatID: ChatID,
        caption: String? = nil,
        parseMode: ParseMode? = nil,
        captionEntities: [MessageEntity]? = nil,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        replyToMessageID: Int? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) async throws -> MessageID {
        try await copy(
            with: bot,
            to: chatID,
            caption: caption,
            parseMode: parseMode,
            captionEntities: captionEntities,
            disableNotification: disableNotification,
            protectContent: protectContent,
            replyToMessageID: replyToMessageID,
            allowSendingWithoutReply: allowSendingWithoutReply,
            replyMarkup: replyMarkup
        )
        .get()
    }
}
