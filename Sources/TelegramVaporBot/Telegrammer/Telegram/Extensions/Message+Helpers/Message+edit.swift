import NIOCore

public extension Message {
    /// Use this helper method to edit text and game messages.
    ///
    /// - Parameters:
    ///    - text: New text of the message, 1-4096 characters after entities parsing
    ///    - parseMode: Mode for parsing entities in the message text. See formatting options for more details.
    ///    - replyMarkup: A JSON-serialized object for an inline keyboard.
    ///    - entities: A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse\_mode
    ///    - disableWebPagePreview: Disables link previews for links in this message
    ///
    /// - Throws: Throws on errors
    /// - Returns: On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    @discardableResult
    func edit(
        with bot: BotProtocol,
        text: String,
        parseMode: ParseMode? = nil,
        entities: [MessageEntity]? = nil,
        disableWebPagePreview: Bool? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) throws -> EventLoopFuture<Message> {
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
            .map { result in
                if case let .message(message) = result {
                    return message
                } else {
                    fatalError("Since edited message is not an inline message, a `Message` is expected to return but `Bool` returned.")
                }
            }
    }

    /// Use this helper method to edit text and game messages.
    ///
    /// - Parameters:
    ///    - text: New text of the message, 1-4096 characters after entities parsing
    ///    - parseMode: Mode for parsing entities in the message text. See formatting options for more details.
    ///    - replyMarkup: A JSON-serialized object for an inline keyboard.
    ///    - entities: A JSON-serialized list of special entities that appear in message text, which can be specified instead of parse\_mode
    ///    - disableWebPagePreview: Disables link previews for links in this message
    ///
    /// - Throws: Throws on errors
    /// - Returns: On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    @discardableResult
    func edit(
        with bot: BotProtocol,
        text: String,
        parseMode: ParseMode? = nil,
        entities: [MessageEntity]? = nil,
        disableWebPagePreview: Bool? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) async throws -> Message {
        try await edit(
            with: bot,
            text: text,
            parseMode: parseMode,
            entities: entities,
            disableWebPagePreview: disableWebPagePreview,
            replyMarkup: replyMarkup
        )
        .get()
    }

    /// Use this method to edit captions of messages.
    ///
    /// - Parameters:
    ///   - caption: New caption of the message, 0-1024 characters after entities parsing
    ///   - parseMode: Mode for parsing entities in the message caption. See formatting options for more details.
    ///   - captionEntities: A JSON-serialized list of special entities that appear in the caption, which can be specified instead of `parseMode`
    ///   - replyMarkup: A JSON-serialized object for an inline keyboard.
    ///
    /// - Returns: On success, the edited Message is returned
    @discardableResult
    func edit(
        with bot: BotProtocol,
        caption: String,
        parseMode: ParseMode? = nil,
        captionEntities: [MessageEntity]? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) throws -> EventLoopFuture<Message> {
        let params = EditMessageCaptionParams(
            chatID: .chat(chat.id),
            messageID: messageID,
            inlineMessageID: nil,
            caption: caption,
            parseMode: parseMode,
            captionEntities: captionEntities,
            replyMarkup: replyMarkup
        )

        return try bot.editMessageCaption(params: params)
            .map { result in
                if case let .message(message) = result {
                    return message
                } else {
                    fatalError("Since edited message is not an inline message, a `Message` is expected to return but `Bool` returned.")
                }
            }
    }

    /// Use this method to edit captions of messages.
    ///
    /// - Parameters:
    ///   - caption: New caption of the message, 0-1024 characters after entities parsing
    ///   - parseMode: Mode for parsing entities in the message caption. See formatting options for more details.
    ///   - captionEntities: A JSON-serialized list of special entities that appear in the caption, which can be specified instead of `parseMode`
    ///   - replyMarkup: A JSON-serialized object for an inline keyboard.
    ///
    /// - Returns: On success, the edited Message is returned
    @discardableResult
    func edit(
        with bot: BotProtocol,
        caption: String,
        parseMode: ParseMode? = nil,
        captionEntities: [MessageEntity]? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) async throws -> Message {
        try await edit(
            with: bot,
            caption: caption,
            parseMode: parseMode,
            captionEntities: captionEntities,
            replyMarkup: replyMarkup
        )
        .get()
    }

    /// Use this method to edit animation, audio, document, photo, or video messages. If a message is part of a message album, then it can be edited only to an audio for audio albums, only to a document for document albums and to a photo or a video otherwise.
    ///
    /// - Parameters:
    ///   - media: A JSON-serialized object for a new media content of the message
    ///   - replyMarkup: A JSON-serialized object for a new inline keyboard.
    ///
    /// - Returns: On success, the edited Message is returned.
    @discardableResult
    func edit(
        with bot: BotProtocol,
        media: InputMedia,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) throws -> EventLoopFuture<Message> {
        let params = EditMessageMediaParams(
            chatID: .chat(chat.id),
            messageID: messageID,
            inlineMessageID: nil,
            media: media,
            replyMarkup: replyMarkup
        )

        return try bot.editMessageMedia(params: params)
            .map { result in
                if case let .message(message) = result {
                    return message
                } else {
                    fatalError("Since edited message is not an inline message, a `Message` is expected to return but `Bool` returned.")
                }
            }
    }

    /// Use this method to edit animation, audio, document, photo, or video messages. If a message is part of a message album, then it can be edited only to an audio for audio albums, only to a document for document albums and to a photo or a video otherwise. When an inline message is edited, a new file can't be uploaded; use a previously uploaded file via its file_id or specify a URL.
    ///
    /// - Parameters:
    ///   - media: A JSON-serialized object for a new media content of the message
    ///   - replyMarkup: A JSON-serialized object for a new inline keyboard.
    ///
    /// - Returns: On success, the edited Message is returned.
    @discardableResult
    func edit(
        with bot: BotProtocol,
        media: InputMedia,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) async throws -> Message {
        try await edit(with: bot, media: media, replyMarkup: replyMarkup).get()
    }

    /// Use this method to edit only the reply markup of messages. On success, if the edited message is not an inline message, the edited Message is returned, otherwise True is returned.
    ///
    /// - Parameters:
    ///   - replyMarkup: A JSON-serialized object for a new inline keyboard.
    ///
    /// - Returns: On success, the edited Message is returned.
    @discardableResult
    func edit(
        with bot: BotProtocol,
        replyMarkup: InlineKeyboardMarkup
    ) throws -> EventLoopFuture<Message> {
        let params = EditMessageReplyMarkupParams(
            chatID: .chat(chat.id),
            messageID: messageID,
            inlineMessageID: nil,
            replyMarkup: replyMarkup
        )

        return try bot.editMessageReplyMarkup(params: params)
            .map { result in
                if case let .message(message) = result {
                    return message
                } else {
                    fatalError("Since edited message is not an inline message, a `Message` is expected to return but `Bool` returned.")
                }
            }
    }

    /// Use this method to edit only the reply markup of messages.
    ///
    /// - Parameters:
    ///   - replyMarkup: A JSON-serialized object for a new inline keyboard.
    ///
    /// - Returns: On success, the edited Message is returned.
    @discardableResult
    func edit(
        with bot: BotProtocol,
        replyMarkup: InlineKeyboardMarkup
    ) async throws -> Message {
        try await edit(with: bot, replyMarkup: replyMarkup).get()
    }
}
