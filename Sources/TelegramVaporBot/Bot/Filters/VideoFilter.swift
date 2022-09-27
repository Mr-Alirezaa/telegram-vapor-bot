import Foundation

/// Messages that contain `Video`
public class VideoFilter: Filter {
    public var name = "video"

    override
    public func filter(message: Message) -> Bool {
        message.video != nil
    }
}

public extension Filter {
    static var video: VideoFilter { VideoFilter() }
}
