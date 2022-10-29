import Foundation

public protocol HandlerProtocol {
    var id: Int { get set }
    var name: String { get }

    func check(update: Update) -> Bool
}

public extension HandlerProtocol {
    var name: String {
        String(describing: Self.self)
    }
}
