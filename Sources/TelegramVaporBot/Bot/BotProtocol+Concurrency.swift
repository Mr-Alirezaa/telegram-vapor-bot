#if compiler(>=5.5) && canImport(_Concurrency)
import Foundation
import Vapor

public extension BotProtocol {
    @discardableResult
    func getUpdates(params: GetUpdatesParams?) async throws -> [Update] {
        try await self.getUpdates(params: params).get()
    }

    @discardableResult
    func setWebhook(params: SetWebhookParams) async throws -> Bool {
        try await self.setWebhook(params: params).get()
    }

    @discardableResult
    func deleteWebhook(params: DeleteWebhookParams?) async throws -> Bool {
        try await self.deleteWebhook(params: params).get()
    }

    @discardableResult
    func getWebhookInfo() async throws -> WebhookInfo {
        try await self.getWebhookInfo().get()
    }

    @discardableResult
    func getMe() async throws -> User {
        try await self.getMe().get()
    }

    @discardableResult
    func logOut() async throws -> Bool {
        try await self.logOut().get()
    }

    @discardableResult
    func close() async throws -> Bool {
        try await self.close().get()
    }

    @discardableResult
    func sendMessage(params: SendMessageParams) async throws -> Message {
        try await self.sendMessage(params: params).get()
    }

    @discardableResult
    func forwardMessage(params: ForwardMessageParams) async throws -> Message {
        try await self.forwardMessage(params: params).get()
    }

    @discardableResult
    func copyMessage(params: CopyMessageParams) async throws -> MessageId {
        try await self.copyMessage(params: params).get()
    }

    @discardableResult
    func sendPhoto(params: SendPhotoParams) async throws -> Message {
        try await self.sendPhoto(params: params).get()
    }

    @discardableResult
    func sendAudio(params: SendAudioParams) async throws -> Message {
        try await self.sendAudio(params: params).get()
    }

    @discardableResult
    func sendDocument(params: SendDocumentParams) async throws -> Message {
        try await self.sendDocument(params: params).get()
    }

    @discardableResult
    func sendVideo(params: SendVideoParams) async throws -> Message {
        try await self.sendVideo(params: params).get()
    }

    @discardableResult
    func sendAnimation(params: SendAnimationParams) async throws -> Message {
        try await self.sendAnimation(params: params).get()
    }

    @discardableResult
    func sendVoice(params: SendVoiceParams) async throws -> Message {
        try await self.sendVoice(params: params).get()
    }

    @discardableResult
    func sendVideoNote(params: SendVideoNoteParams) async throws -> Message {
        try await self.sendVideoNote(params: params).get()
    }

    @discardableResult
    func sendMediaGroup(params: SendMediaGroupParams) async throws -> [Message] {
        try await self.sendMediaGroup(params: params).get()
    }

    @discardableResult
    func sendLocation(params: SendLocationParams) async throws -> Message {
        try await self.sendLocation(params: params).get()
    }

    @discardableResult
    func editMessageLiveLocation(params: EditMessageLiveLocationParams) async throws -> MessageOrBool {
        try await self.editMessageLiveLocation(params: params).get()
    }

    @discardableResult
    func stopMessageLiveLocation(params: StopMessageLiveLocationParams?) async throws -> MessageOrBool {
        try await self.stopMessageLiveLocation(params: params).get()
    }

    @discardableResult
    func sendVenue(params: SendVenueParams) async throws -> Message {
        try await self.sendVenue(params: params).get()
    }

    @discardableResult
    func sendContact(params: SendContactParams) async throws -> Message {
        try await self.sendContact(params: params).get()
    }

    @discardableResult
    func sendPoll(params: SendPollParams) async throws -> Message {
        try await self.sendPoll(params: params).get()
    }

    @discardableResult
    func sendDice(params: SendDiceParams) async throws -> Message {
        try await self.sendDice(params: params).get()
    }

    @discardableResult
    func sendChatAction(params: SendChatActionParams) async throws -> Bool {
        try await self.sendChatAction(params: params).get()
    }

    @discardableResult
    func getUserProfilePhotos(params: GetUserProfilePhotosParams) async throws -> UserProfilePhotos {
        try await self.getUserProfilePhotos(params: params).get()
    }

    @discardableResult
    func getFile(params: GetFileParams) async throws -> File {
        try await self.getFile(params: params).get()
    }

    @discardableResult
    func banChatMember(params: BanChatMemberParams) async throws -> Bool {
        try await self.banChatMember(params: params).get()
    }

    @discardableResult
    func unbanChatMember(params: UnbanChatMemberParams) async throws -> Bool {
        try await self.unbanChatMember(params: params).get()
    }

    @discardableResult
    func restrictChatMember(params: RestrictChatMemberParams) async throws -> Bool {
        try await self.restrictChatMember(params: params).get()
    }

    @discardableResult
    func promoteChatMember(params: PromoteChatMemberParams) async throws -> Bool {
        try await self.promoteChatMember(params: params).get()
    }

    @discardableResult
    func setChatAdministratorCustomTitle(params: SetChatAdministratorCustomTitleParams) async throws -> Bool {
        try await self.setChatAdministratorCustomTitle(params: params).get()
    }

    @discardableResult
    func banChatSenderChat(params: BanChatSenderChatParams) async throws -> Bool {
        try await self.banChatSenderChat(params: params).get()
    }

    @discardableResult
    func unbanChatSenderChat(params: UnbanChatSenderChatParams) async throws -> Bool {
        try await self.unbanChatSenderChat(params: params).get()
    }

    @discardableResult
    func setChatPermissions(params: SetChatPermissionsParams) async throws -> Bool {
        try await self.setChatPermissions(params: params).get()
    }

    @discardableResult
    func exportChatInviteLink(params: ExportChatInviteLinkParams) async throws -> String {
        try await self.exportChatInviteLink(params: params).get()
    }

    @discardableResult
    func createChatInviteLink(params: CreateChatInviteLinkParams) async throws -> Bool {
        try await self.createChatInviteLink(params: params).get()
    }

    @discardableResult
    func editChatInviteLink(params: EditChatInviteLinkParams) async throws -> Bool {
        try await self.editChatInviteLink(params: params).get()
    }

    @discardableResult
    func revokeChatInviteLink(params: RevokeChatInviteLinkParams) async throws -> Bool {
        try await self.revokeChatInviteLink(params: params).get()
    }

    @discardableResult
    func approveChatJoinRequest(params: ApproveChatJoinRequestParams) async throws -> Bool {
        try await self.approveChatJoinRequest(params: params).get()
    }

    @discardableResult
    func declineChatJoinRequest(params: DeclineChatJoinRequestParams) async throws -> Bool {
        try await self.declineChatJoinRequest(params: params).get()
    }

    @discardableResult
    func setChatPhoto(params: SetChatPhotoParams) async throws -> Bool {
        try await self.setChatPhoto(params: params).get()
    }

    @discardableResult
    func deleteChatPhoto(params: DeleteChatPhotoParams) async throws -> Bool {
        try await self.deleteChatPhoto(params: params).get()
    }

    @discardableResult
    func setChatTitle(params: SetChatTitleParams) async throws -> Bool {
        try await self.setChatTitle(params: params).get()
    }

    @discardableResult
    func setChatDescription(params: SetChatDescriptionParams) async throws -> Bool {
        try await self.setChatDescription(params: params).get()
    }

    @discardableResult
    func pinChatMessage(params: PinChatMessageParams) async throws -> Bool {
        try await self.pinChatMessage(params: params).get()
    }

    @discardableResult
    func unpinChatMessage(params: UnpinChatMessageParams) async throws -> Bool {
        try await self.unpinChatMessage(params: params).get()
    }

    @discardableResult
    func unpinAllChatMessages(params: UnpinAllChatMessagesParams) async throws -> Bool {
        try await self.unpinAllChatMessages(params: params).get()
    }

    @discardableResult
    func leaveChat(params: LeaveChatParams) async throws -> Bool {
        try await self.leaveChat(params: params).get()
    }

    @discardableResult
    func getChat(params: GetChatParams) async throws -> Chat {
        try await self.getChat(params: params).get()
    }

    @discardableResult
    func getChatAdministrators(params: GetChatAdministratorsParams) async throws -> [ChatMember] {
        try await self.getChatAdministrators(params: params).get()
    }

    @discardableResult
    func getChatMemberCount(params: GetChatMemberCountParams) async throws -> Int {
        try await self.getChatMemberCount(params: params).get()
    }

    @discardableResult
    func getChatMember(params: GetChatMemberParams) async throws -> ChatMember {
        try await self.getChatMember(params: params).get()
    }

    @discardableResult
    func setChatStickerSet(params: SetChatStickerSetParams) async throws -> Bool {
        try await self.setChatStickerSet(params: params).get()
    }

    @discardableResult
    func deleteChatStickerSet(params: DeleteChatStickerSetParams) async throws -> Bool {
        try await self.deleteChatStickerSet(params: params).get()
    }

    @discardableResult
    func answerCallbackQuery(params: AnswerCallbackQueryParams) async throws -> Bool {
        try await self.answerCallbackQuery(params: params).get()
    }

    @discardableResult
    func setMyCommands(params: SetMyCommandsParams) async throws -> Bool {
        try await self.setMyCommands(params: params).get()
    }

    @discardableResult
    func deleteMyCommands(params: DeleteMyCommandsParams?) async throws -> Bool {
        try await self.deleteMyCommands(params: params).get()
    }

    @discardableResult
    func getMyCommands(params: GetMyCommandsParams?) async throws -> [BotCommand] {
        try await self.getMyCommands(params: params).get()
    }

    @discardableResult
    func setChatMenuButton(params: SetChatMenuButtonParams?) async throws -> Bool {
        try await self.setChatMenuButton(params: params).get()
    }

    @discardableResult
    func getChatMenuButton(params: GetChatMenuButtonParams?) async throws -> MenuButton {
        try await self.getChatMenuButton(params: params).get()
    }

    @discardableResult
    func setMyDefaultAdministratorRights(params: SetMyDefaultAdministratorRightsParams?) async throws -> Bool {
        try await self.setMyDefaultAdministratorRights(params: params).get()
    }

    @discardableResult
    func getMyDefaultAdministratorRights(params: GetMyDefaultAdministratorRightsParams?) async throws -> ChatAdministratorRights {
        try await self.getMyDefaultAdministratorRights(params: params).get()
    }

    @discardableResult
    func editMessageText(params: EditMessageTextParams) async throws -> MessageOrBool {
        try await self.editMessageText(params: params).get()
    }

    @discardableResult
    func editMessageCaption(params: EditMessageCaptionParams?) async throws -> MessageOrBool {
        try await self.editMessageCaption(params: params).get()
    }

    @discardableResult
    func editMessageMedia(params: EditMessageMediaParams) async throws -> MessageOrBool {
        try await self.editMessageMedia(params: params).get()
    }

    @discardableResult
    func editMessageReplyMarkup(params: EditMessageReplyMarkupParams?) async throws -> MessageOrBool {
        try await self.editMessageReplyMarkup(params: params).get()
    }

    @discardableResult
    func stopPoll(params: StopPollParams) async throws -> Poll {
        try await self.stopPoll(params: params).get()
    }

    @discardableResult
    func deleteMessage(params: DeleteMessageParams) async throws -> Bool {
        try await self.deleteMessage(params: params).get()
    }

    @discardableResult
    func sendSticker(params: SendStickerParams) async throws -> Message {
        try await self.sendSticker(params: params).get()
    }

    @discardableResult
    func getStickerSet(params: GetStickerSetParams) async throws -> StickerSet {
        try await self.getStickerSet(params: params).get()
    }

    @discardableResult
    func getCustomEmojiStickers(params: GetCustomEmojiStickersParams) async throws -> [Sticker] {
        try await self.getCustomEmojiStickers(params: params).get()
    }

    @discardableResult
    func uploadStickerFile(params: UploadStickerFileParams) async throws -> File {
        try await self.uploadStickerFile(params: params).get()
    }

    @discardableResult
    func createNewStickerSet(params: CreateNewStickerSetParams) async throws -> Bool {
        try await self.createNewStickerSet(params: params).get()
    }

    @discardableResult
    func addStickerToSet(params: AddStickerToSetParams) async throws -> Bool {
        try await self.addStickerToSet(params: params).get()
    }

    @discardableResult
    func setStickerPositionInSet(params: SetStickerPositionInSetParams) async throws -> Bool {
        try await self.setStickerPositionInSet(params: params).get()
    }

    @discardableResult
    func deleteStickerFromSet(params: DeleteStickerFromSetParams) async throws -> Bool {
        try await self.deleteStickerFromSet(params: params).get()
    }

    @discardableResult
    func setStickerSetThumb(params: SetStickerSetThumbParams) async throws -> Bool {
        try await self.setStickerSetThumb(params: params).get()
    }

    @discardableResult
    func answerInlineQuery(params: AnswerInlineQueryParams) async throws -> Bool {
        try await self.answerInlineQuery(params: params).get()
    }

    @discardableResult
    func answerWebAppQuery(params: AnswerWebAppQueryParams) async throws -> SentWebAppMessage {
        try await self.answerWebAppQuery(params: params).get()
    }

    @discardableResult
    func sendInvoice(params: SendInvoiceParams) async throws -> Message {
        try await self.sendInvoice(params: params).get()
    }

    @discardableResult
    func createInvoiceLink(params: CreateInvoiceLinkParams) async throws -> String {
        try await self.createInvoiceLink(params: params).get()
    }

    @discardableResult
    func answerShippingQuery(params: AnswerShippingQueryParams) async throws -> Bool {
        try await self.answerShippingQuery(params: params).get()
    }

    @discardableResult
    func answerPreCheckoutQuery(params: AnswerPreCheckoutQueryParams) async throws -> Bool {
        try await self.answerPreCheckoutQuery(params: params).get()
    }

    @discardableResult
    func setPassportDataErrors(params: SetPassportDataErrorsParams) async throws -> Bool {
        try await self.setPassportDataErrors(params: params).get()
    }

    @discardableResult
    func sendGame(params: SendGameParams) async throws -> Message {
        try await self.sendGame(params: params).get()
    }

    @discardableResult
    func setGameScore(params: SetGameScoreParams) async throws -> MessageOrBool {
        try await self.setGameScore(params: params).get()
    }

    @discardableResult
    func getGameHighScores(params: GetGameHighScoresParams) async throws -> [GameHighScore] {
        try await self.getGameHighScores(params: params).get()
    }
}
#endif
