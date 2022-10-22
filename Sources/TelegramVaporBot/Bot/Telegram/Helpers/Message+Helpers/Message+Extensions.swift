import NIOCore

public extension Message {
    /// Checks whether a message contains the specified command.
    ///
    /// - Parameter command: The command to check
    /// - Returns: True if the message text contains the command
    func contains(command: String) -> Bool {
        guard let text = text?.utf16, let entities = entities else { return false }
        let commands = entities.compactMap { entity -> String? in
            guard entity.type == .botCommand else { return nil }
            let start = text.index(text.startIndex, offsetBy: entity.offset)
            let end = text.index(start, offsetBy: entity.length - 1)
            let cmd = String(text[start ... end])
            return cmd == command ? cmd : nil
        }
        return !commands.isEmpty
    }
}
