//
//
//

//

import Foundation

/// Messages that contain `VideoNote`
public class VideoNoteFilter: Filter {

    public var name: String = "video_note"

    override
    public func filter(message: Message) -> Bool {
        return message.videoNote != nil
    }
}

public extension Filter {
    static var videoNote: VideoNoteFilter { VideoNoteFilter() }
}
