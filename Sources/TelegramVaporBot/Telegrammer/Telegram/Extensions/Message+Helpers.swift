public extension Message {
    /// Helper method to easy reply to message
    ///
    /// - Parameters:
    ///    - text: Text to send in reply
    ///    - bot: Bot from which send reply
    ///    - parseMode: Optional. Text format
    ///    - replyMarkup: Optional. Reply Markup
    ///
    /// - Throws: Throws on errors
    func reply(text: String, bot: BotProtocol, parseMode: ParseMode? = nil, replyMarkup: ReplyMarkup? = nil) throws {
        let params = SendMessageParams(
            chatID: .chat(chat.id),
            text: text,
            parseMode: parseMode,
            replyMarkup: replyMarkup
        )
        try bot.sendMessage(params: params)
    }

    /// Helper method to easy edit message
    ///
    /// - Parameters:
    ///    - text: Text to send in reply
    ///    - bot: Bot from which send reply
    ///    - parseMode: Optional. Text format
    ///    - replyMarkup: Optional. Reply Markup
    ///
    /// - Throws: Throws on errors
    func edit(
        text: String,
        bot: BotProtocol,
        parseMode: ParseMode? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil
    ) throws {
        let params = EditMessageTextParams(
            chatID: .chat(chat.id),
            messageID: messageID,
            text: text,
            parseMode: parseMode,
            replyMarkup: replyMarkup
        )
        try bot.editMessageText(params: params)
    }

    /// Helper method to easy edit message
    ///
    /// - Parameters:
    ///    - bot: Bot from which send reply
    ///
    /// - Throws: Throws on errors
    func delete(bot: BotProtocol) throws {
        let params = DeleteMessageParams(
            chatID: .chat(chat.id),
            messageID: messageID
        )
        try bot.deleteMessage(params: params)
    }

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
