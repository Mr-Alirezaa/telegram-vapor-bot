import Foundation

public extension DefaultClient {
    struct CoreError: Error {
        public enum `Type` {
            case `internal`
            case network
            case server
        }

        public let type: Type
        public let description: String
        public let reason: String

        public init(type: Type, description: String = "", reason: String = "") {
            self.type = type
            self.description = description
            self.reason = reason
        }

        public var localizedDescription: String {
        """

        >>>Type: \(type)
        >>>Description: \(description)
        >>>Reason: \(reason)

        """
        }
    }
}
