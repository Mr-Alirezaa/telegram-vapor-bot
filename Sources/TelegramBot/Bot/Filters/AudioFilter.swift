import Foundation

/// Messages that contain `Audio`
public class AudioFilter: Filter {
    public var name = "audio"

    override
    public func filter(message: Message) -> Bool {
        message.audio != nil
    }
}

public extension Filter {
    static var audio: AudioFilter { AudioFilter() }
}
