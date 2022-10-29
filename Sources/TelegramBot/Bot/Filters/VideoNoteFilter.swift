import Foundation

/// Messages that contain `VideoNote`
public class VideoNoteFilter: Filter {
    public var name = "video_note"

    override
    public func filter(message: Message) -> Bool {
        message.videoNote != nil
    }
}

public extension Filter {
    static var videoNote: VideoNoteFilter { VideoNoteFilter() }
}
