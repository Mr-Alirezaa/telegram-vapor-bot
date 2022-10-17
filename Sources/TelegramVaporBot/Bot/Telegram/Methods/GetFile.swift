import Vapor

/// Parameters container struct for `getFile` method
public struct GetFileParams: Encodable {
    /// File identifier to get information about
    public var fileID: String

    /// Custom keys for coding/decoding `GetFileParams` struct
    public enum CodingKeys: String, CodingKey {
        case fileID = "file_id"
    }

    public init(fileID: String) {
        self.fileID = fileID
    }
}

public extension Bot {
    /// Use this method to get basic information about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file\_path>, where <file\_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [GetFileParams](https://core.telegram.org/bots/api#getfile)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `GetFileParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `File` type
    @discardableResult func getFile(params: GetFileParams) throws -> EventLoopFuture<File> {
        let methodURL: URI = .init(string: getMethodURL("getFile"))
        let future: EventLoopFuture<File> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
