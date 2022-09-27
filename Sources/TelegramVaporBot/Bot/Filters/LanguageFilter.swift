import Foundation

/// Filters messages to only allow those which are from users with a certain language code.
///
/// Note: According to telegrams documentation, every single user does not have the language_code attribute.
public class LanguageFilter: Filter {
    var lang: String

    public init(lang: String) {
        self.lang = lang
        super.init()
    }

    public var name = "language"

    override
    public func filter(message: Message) -> Bool {
        guard let languageCode = message.from?.languageCode else { return true }
        return languageCode.starts(with: lang)
    }
}

public extension Filter {
    static func language(_ lang: String) -> LanguageFilter {
        LanguageFilter(lang: lang)
    }
}
