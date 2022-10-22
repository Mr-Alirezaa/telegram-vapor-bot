import Foundation
import Logging

public extension Error {
    var logMessage: Logger.Message {
        var errorDescription: String
        if let coreError = self as? DefaultClient.CoreError {
            errorDescription = coreError.localizedDescription
        } else if let decodingError = self as? DecodingError {
            switch decodingError {
            case let .dataCorrupted(context):
                errorDescription = context.debugDescription
            case let .keyNotFound(_, context):
                errorDescription = context.debugDescription
            case let .typeMismatch(_, context):
                errorDescription = context.debugDescription
            case let .valueNotFound(_, context):
                errorDescription = context.debugDescription
            @unknown default:
                errorDescription = "Unknown DecodingError"
            }
        } else {
            errorDescription = "Cannot detect error type, providing default description:\n\(localizedDescription)"
        }
        return Logger.Message(stringLiteral: errorDescription)
    }

    var rawMessage: Logger.Message {
        "\(localizedDescription)"
    }
}
