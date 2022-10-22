import NIOCore

public extension Message {
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
        with bot: BotProtocol,
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
        with bot: BotProtocol,
        to chatID: ChatID,
        disableNotification: Bool?,
        protectContent: Bool?
    ) async throws -> Message {
        try await forward(
            with: bot,
            to: chatID,
            disableNotification: disableNotification,
            protectContent: protectContent
        )
        .get()
    }
}
