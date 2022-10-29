
/// Describes documents or other Telegram Passport elements shared with the bot by the user.
///
/// SeeAlso Telegram Bot API Reference:
/// [EncryptedPassportElement](https://core.telegram.org/bots/api#encryptedpassportelement)
public final class EncryptedPassportElement: Codable {
    /// Custom keys for coding/decoding `EncryptedPassportElement` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case data
        case phoneNumber = "phone_number"
        case email
        case files
        case frontSide = "front_side"
        case reverseSide = "reverse_side"
        case selfie
        case translation
        case hash
    }

    /// Element type. One of “personal\_details”, “passport”, “driver\_license”, “identity\_card”, “internal\_passport”, “address”, “utility\_bill”, “bank\_statement”, “rental\_agreement”, “passport\_registration”, “temporary\_registration”, “phone\_number”, “email”.
    public var type: String

    /// Optional. Base64-encoded encrypted Telegram Passport element data provided by the user, available for “personal\_details”, “passport”, “driver\_license”, “identity\_card”, “internal\_passport” and “address” types. Can be decrypted and verified using the accompanying EncryptedCredentials.
    public var data: String?

    /// Optional. User's verified phone number, available only for “phone\_number” type
    public var phoneNumber: String?

    /// Optional. User's verified email address, available only for “email” type
    public var email: String?

    /// Optional. Array of encrypted files with documents provided by the user, available for “utility\_bill”, “bank\_statement”, “rental\_agreement”, “passport\_registration” and “temporary\_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
    public var files: [PassportFile]?

    /// Optional. Encrypted file with the front side of the document, provided by the user. Available for “passport”, “driver\_license”, “identity\_card” and “internal\_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    public var frontSide: PassportFile?

    /// Optional. Encrypted file with the reverse side of the document, provided by the user. Available for “driver\_license” and “identity\_card”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    public var reverseSide: PassportFile?

    /// Optional. Encrypted file with the selfie of the user holding a document, provided by the user; available for “passport”, “driver\_license”, “identity\_card” and “internal\_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.
    public var selfie: PassportFile?

    /// Optional. Array of encrypted files with translated versions of documents provided by the user. Available if requested for “passport”, “driver\_license”, “identity\_card”, “internal\_passport”, “utility\_bill”, “bank\_statement”, “rental\_agreement”, “passport\_registration” and “temporary\_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.
    public var translation: [PassportFile]?

    /// Base64-encoded element hash for using in PassportElementErrorUnspecified
    public var hash: String

    public init(
        type: String,
        data: String? = nil,
        phoneNumber: String? = nil,
        email: String? = nil,
        files: [PassportFile]? = nil,
        frontSide: PassportFile? = nil,
        reverseSide: PassportFile? = nil,
        selfie: PassportFile? = nil,
        translation: [PassportFile]? = nil,
        hash: String
    ) {
        self.type = type
        self.data = data
        self.phoneNumber = phoneNumber
        self.email = email
        self.files = files
        self.frontSide = frontSide
        self.reverseSide = reverseSide
        self.selfie = selfie
        self.translation = translation
        self.hash = hash
    }
}
