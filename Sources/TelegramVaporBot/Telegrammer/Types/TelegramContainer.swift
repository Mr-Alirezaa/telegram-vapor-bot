/// This object represents a Telegram server response container.
public struct TelegramContainer<T: Codable>: Codable {
    enum CodingKeys: String, CodingKey {
        case ok
        case result
        case description
        case errorCode = "error_code"
        case parameters
    }

    public var ok: Bool
    public var result: T?
    public var description: String?
    public var errorCode: Int?
    public var parameters: ResponseParameters?

    public init(ok: Bool, result: T?, description: String?, errorCode: Int?, parameters: ResponseParameters?) {
        self.ok = ok
        self.result = result
        self.description = description
        self.errorCode = errorCode
        self.parameters = parameters
    }
}
