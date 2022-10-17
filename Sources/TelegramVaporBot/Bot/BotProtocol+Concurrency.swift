#if compiler(>=5.5) && canImport(_Concurrency)
    import Foundation
    import Vapor

    public extension BotProtocol {
        @discardableResult func getUpdates(params: GetUpdatesParams?) async throws -> [Update] {
            try await getUpdates(params: params).get()
        }

        @discardableResult func setWebhook(params: SetWebhookParams) async throws -> Bool {
            try await setWebhook(params: params).get()
        }

        @discardableResult func deleteWebhook(params: DeleteWebhookParams?) async throws -> Bool {
            try await deleteWebhook(params: params).get()
        }

        @discardableResult func getWebhookInfo() async throws -> WebhookInfo {
            try await getWebhookInfo().get()
        }

        @discardableResult func getMe() async throws -> User {
            try await getMe().get()
        }

        @discardableResult func logOut() async throws -> Bool {
            try await logOut().get()
        }

        @discardableResult func close() async throws -> Bool {
            try await close().get()
        }

        @discardableResult func sendMessage(params: SendMessageParams) async throws -> Message {
            try await sendMessage(params: params).get()
        }

        @discardableResult func forwardMessage(params: ForwardMessageParams) async throws -> Message {
            try await forwardMessage(params: params).get()
        }

        @discardableResult func copyMessage(params: CopyMessageParams) async throws -> MessageID {
            try await copyMessage(params: params).get()
        }

        @discardableResult func sendPhoto(params: SendPhotoParams) async throws -> Message {
            try await sendPhoto(params: params).get()
        }

        @discardableResult func sendAudio(params: SendAudioParams) async throws -> Message {
            try await sendAudio(params: params).get()
        }

        @discardableResult func sendDocument(params: SendDocumentParams) async throws -> Message {
            try await sendDocument(params: params).get()
        }

        @discardableResult func sendVideo(params: SendVideoParams) async throws -> Message {
            try await sendVideo(params: params).get()
        }

        @discardableResult func sendAnimation(params: SendAnimationParams) async throws -> Message {
            try await sendAnimation(params: params).get()
        }

        @discardableResult func sendVoice(params: SendVoiceParams) async throws -> Message {
            try await sendVoice(params: params).get()
        }

        @discardableResult func sendVideoNote(params: SendVideoNoteParams) async throws -> Message {
            try await sendVideoNote(params: params).get()
        }

        @discardableResult func sendMediaGroup(params: SendMediaGroupParams) async throws -> [Message] {
            try await sendMediaGroup(params: params).get()
        }

        @discardableResult func sendLocation(params: SendLocationParams) async throws -> Message {
            try await sendLocation(params: params).get()
        }

        @discardableResult func editMessageLiveLocation(params: EditMessageLiveLocationParams) async throws
            -> MessageOrBool
        {
            try await editMessageLiveLocation(params: params).get()
        }

        @discardableResult func stopMessageLiveLocation(params: StopMessageLiveLocationParams?) async throws
            -> MessageOrBool
        {
            try await stopMessageLiveLocation(params: params).get()
        }

        @discardableResult func sendVenue(params: SendVenueParams) async throws -> Message {
            try await sendVenue(params: params).get()
        }

        @discardableResult func sendContact(params: SendContactParams) async throws -> Message {
            try await sendContact(params: params).get()
        }

        @discardableResult func sendPoll(params: SendPollParams) async throws -> Message {
            try await sendPoll(params: params).get()
        }

        @discardableResult func sendDice(params: SendDiceParams) async throws -> Message {
            try await sendDice(params: params).get()
        }

        @discardableResult func sendChatAction(params: SendChatActionParams) async throws -> Bool {
            try await sendChatAction(params: params).get()
        }

        @discardableResult func getUserProfilePhotos(params: GetUserProfilePhotosParams) async throws
            -> UserProfilePhotos
        {
            try await getUserProfilePhotos(params: params).get()
        }

        @discardableResult func getFile(params: GetFileParams) async throws -> File {
            try await getFile(params: params).get()
        }

        @discardableResult func banChatMember(params: BanChatMemberParams) async throws -> Bool {
            try await banChatMember(params: params).get()
        }

        @discardableResult func unbanChatMember(params: UnbanChatMemberParams) async throws -> Bool {
            try await unbanChatMember(params: params).get()
        }

        @discardableResult func restrictChatMember(params: RestrictChatMemberParams) async throws -> Bool {
            try await restrictChatMember(params: params).get()
        }

        @discardableResult func promoteChatMember(params: PromoteChatMemberParams) async throws -> Bool {
            try await promoteChatMember(params: params).get()
        }

        @discardableResult func setChatAdministratorCustomTitle(
            params: SetChatAdministratorCustomTitleParams
        ) async throws
            -> Bool
        {
            try await setChatAdministratorCustomTitle(params: params).get()
        }

        @discardableResult func banChatSenderChat(params: BanChatSenderChatParams) async throws -> Bool {
            try await banChatSenderChat(params: params).get()
        }

        @discardableResult func unbanChatSenderChat(params: UnbanChatSenderChatParams) async throws -> Bool {
            try await unbanChatSenderChat(params: params).get()
        }

        @discardableResult func setChatPermissions(params: SetChatPermissionsParams) async throws -> Bool {
            try await setChatPermissions(params: params).get()
        }

        @discardableResult func exportChatInviteLink(params: ExportChatInviteLinkParams) async throws -> String {
            try await exportChatInviteLink(params: params).get()
        }

        @discardableResult func createChatInviteLink(params: CreateChatInviteLinkParams) async throws -> Bool {
            try await createChatInviteLink(params: params).get()
        }

        @discardableResult func editChatInviteLink(params: EditChatInviteLinkParams) async throws -> Bool {
            try await editChatInviteLink(params: params).get()
        }

        @discardableResult func revokeChatInviteLink(params: RevokeChatInviteLinkParams) async throws -> Bool {
            try await revokeChatInviteLink(params: params).get()
        }

        @discardableResult func approveChatJoinRequest(params: ApproveChatJoinRequestParams) async throws -> Bool {
            try await approveChatJoinRequest(params: params).get()
        }

        @discardableResult func declineChatJoinRequest(params: DeclineChatJoinRequestParams) async throws -> Bool {
            try await declineChatJoinRequest(params: params).get()
        }

        @discardableResult func setChatPhoto(params: SetChatPhotoParams) async throws -> Bool {
            try await setChatPhoto(params: params).get()
        }

        @discardableResult func deleteChatPhoto(params: DeleteChatPhotoParams) async throws -> Bool {
            try await deleteChatPhoto(params: params).get()
        }

        @discardableResult func setChatTitle(params: SetChatTitleParams) async throws -> Bool {
            try await setChatTitle(params: params).get()
        }

        @discardableResult func setChatDescription(params: SetChatDescriptionParams) async throws -> Bool {
            try await setChatDescription(params: params).get()
        }

        @discardableResult func pinChatMessage(params: PinChatMessageParams) async throws -> Bool {
            try await pinChatMessage(params: params).get()
        }

        @discardableResult func unpinChatMessage(params: UnpinChatMessageParams) async throws -> Bool {
            try await unpinChatMessage(params: params).get()
        }

        @discardableResult func unpinAllChatMessages(params: UnpinAllChatMessagesParams) async throws -> Bool {
            try await unpinAllChatMessages(params: params).get()
        }

        @discardableResult func leaveChat(params: LeaveChatParams) async throws -> Bool {
            try await leaveChat(params: params).get()
        }

        @discardableResult func getChat(params: GetChatParams) async throws -> Chat {
            try await getChat(params: params).get()
        }

        @discardableResult func getChatAdministrators(params: GetChatAdministratorsParams) async throws
            -> [ChatMember]
        {
            try await getChatAdministrators(params: params).get()
        }

        @discardableResult func getChatMemberCount(params: GetChatMemberCountParams) async throws -> Int {
            try await getChatMemberCount(params: params).get()
        }

        @discardableResult func getChatMember(params: GetChatMemberParams) async throws -> ChatMember {
            try await getChatMember(params: params).get()
        }

        @discardableResult func setChatStickerSet(params: SetChatStickerSetParams) async throws -> Bool {
            try await setChatStickerSet(params: params).get()
        }

        @discardableResult func deleteChatStickerSet(params: DeleteChatStickerSetParams) async throws -> Bool {
            try await deleteChatStickerSet(params: params).get()
        }

        @discardableResult func answerCallbackQuery(params: AnswerCallbackQueryParams) async throws -> Bool {
            try await answerCallbackQuery(params: params).get()
        }

        @discardableResult func setMyCommands(params: SetMyCommandsParams) async throws -> Bool {
            try await setMyCommands(params: params).get()
        }

        @discardableResult func deleteMyCommands(params: DeleteMyCommandsParams?) async throws -> Bool {
            try await deleteMyCommands(params: params).get()
        }

        @discardableResult func getMyCommands(params: GetMyCommandsParams?) async throws -> [BotCommand] {
            try await getMyCommands(params: params).get()
        }

        @discardableResult func setChatMenuButton(params: SetChatMenuButtonParams?) async throws -> Bool {
            try await setChatMenuButton(params: params).get()
        }

        @discardableResult func getChatMenuButton(params: GetChatMenuButtonParams?) async throws -> MenuButton {
            try await getChatMenuButton(params: params).get()
        }

        @discardableResult func setMyDefaultAdministratorRights(
            params: SetMyDefaultAdministratorRightsParams?
        ) async throws
            -> Bool
        {
            try await setMyDefaultAdministratorRights(params: params).get()
        }

        @discardableResult func getMyDefaultAdministratorRights(
            params: GetMyDefaultAdministratorRightsParams?
        ) async throws
            -> ChatAdministratorRights
        {
            try await getMyDefaultAdministratorRights(params: params).get()
        }

        @discardableResult func editMessageText(params: EditMessageTextParams) async throws -> MessageOrBool {
            try await editMessageText(params: params).get()
        }

        @discardableResult func editMessageCaption(params: EditMessageCaptionParams?) async throws -> MessageOrBool {
            try await editMessageCaption(params: params).get()
        }

        @discardableResult func editMessageMedia(params: EditMessageMediaParams) async throws -> MessageOrBool {
            try await editMessageMedia(params: params).get()
        }

        @discardableResult func editMessageReplyMarkup(params: EditMessageReplyMarkupParams?) async throws
            -> MessageOrBool
        {
            try await editMessageReplyMarkup(params: params).get()
        }

        @discardableResult func stopPoll(params: StopPollParams) async throws -> Poll {
            try await stopPoll(params: params).get()
        }

        @discardableResult func deleteMessage(params: DeleteMessageParams) async throws -> Bool {
            try await deleteMessage(params: params).get()
        }

        @discardableResult func sendSticker(params: SendStickerParams) async throws -> Message {
            try await sendSticker(params: params).get()
        }

        @discardableResult func getStickerSet(params: GetStickerSetParams) async throws -> StickerSet {
            try await getStickerSet(params: params).get()
        }

        @discardableResult func getCustomEmojiStickers(params: GetCustomEmojiStickersParams) async throws -> [Sticker] {
            try await getCustomEmojiStickers(params: params).get()
        }

        @discardableResult func uploadStickerFile(params: UploadStickerFileParams) async throws -> File {
            try await uploadStickerFile(params: params).get()
        }

        @discardableResult func createNewStickerSet(params: CreateNewStickerSetParams) async throws -> Bool {
            try await createNewStickerSet(params: params).get()
        }

        @discardableResult func addStickerToSet(params: AddStickerToSetParams) async throws -> Bool {
            try await addStickerToSet(params: params).get()
        }

        @discardableResult func setStickerPositionInSet(params: SetStickerPositionInSetParams) async throws -> Bool {
            try await setStickerPositionInSet(params: params).get()
        }

        @discardableResult func deleteStickerFromSet(params: DeleteStickerFromSetParams) async throws -> Bool {
            try await deleteStickerFromSet(params: params).get()
        }

        @discardableResult func setStickerSetThumb(params: SetStickerSetThumbParams) async throws -> Bool {
            try await setStickerSetThumb(params: params).get()
        }

        @discardableResult func answerInlineQuery(params: AnswerInlineQueryParams) async throws -> Bool {
            try await answerInlineQuery(params: params).get()
        }

        @discardableResult func answerWebAppQuery(params: AnswerWebAppQueryParams) async throws -> SentWebAppMessage {
            try await answerWebAppQuery(params: params).get()
        }

        @discardableResult func sendInvoice(params: SendInvoiceParams) async throws -> Message {
            try await sendInvoice(params: params).get()
        }

        @discardableResult func createInvoiceLink(params: CreateInvoiceLinkParams) async throws -> String {
            try await createInvoiceLink(params: params).get()
        }

        @discardableResult func answerShippingQuery(params: AnswerShippingQueryParams) async throws -> Bool {
            try await answerShippingQuery(params: params).get()
        }

        @discardableResult func answerPreCheckoutQuery(params: AnswerPreCheckoutQueryParams) async throws -> Bool {
            try await answerPreCheckoutQuery(params: params).get()
        }

        @discardableResult func setPassportDataErrors(params: SetPassportDataErrorsParams) async throws -> Bool {
            try await setPassportDataErrors(params: params).get()
        }

        @discardableResult func sendGame(params: SendGameParams) async throws -> Message {
            try await sendGame(params: params).get()
        }

        @discardableResult func setGameScore(params: SetGameScoreParams) async throws -> MessageOrBool {
            try await setGameScore(params: params).get()
        }

        @discardableResult func getGameHighScores(params: GetGameHighScoresParams) async throws -> [GameHighScore] {
            try await getGameHighScores(params: params).get()
        }
    }
#endif
