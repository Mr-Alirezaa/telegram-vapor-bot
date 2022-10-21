import NIOCore

public extension User {
    /// Use this helper method to get a list of profile pictures for the user. Returns a `UserProfilePhotos` object.
    ///
    /// - Parameters:
    ///   - offset: Sequential number of the first photo to be returned. By default, all photos are returned.
    ///   - limit: Limits the number of photos to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    ///
    /// - Returns: List of user profile photos as a `UserProfilePhotos`
    @discardableResult
    func getProfilePhotos(
        using bot: BotProtocol,
        offset: Int? = nil,
        limit: Int? = nil
    ) throws -> EventLoopFuture<UserProfilePhotos> {
        let params = GetUserProfilePhotosParams(userID: id, offset: offset, limit: limit)

        return try bot.getUserProfilePhotos(params: params)
    }

    /// Use this helper method to get a list of profile pictures for the user. Returns a `UserProfilePhotos` object.
    ///
    /// - Parameters:
    ///   - offset: Sequential number of the first photo to be returned. By default, all photos are returned.
    ///   - limit: Limits the number of photos to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    ///
    /// - Returns: List of user profile photos as a `UserProfilePhotos`
    @discardableResult
    func getProfilePhotos(
        using bot: BotProtocol,
        offset: Int? = nil,
        limit: Int? = nil
    ) async throws -> UserProfilePhotos {
        try await getProfilePhotos(using: bot, offset: offset, limit: limit).get()
    }
}
