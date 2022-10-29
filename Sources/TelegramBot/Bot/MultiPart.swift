import Foundation

// MARK: Extension NSMutableData

extension NSMutableData {
    func appendString(_ string: String) {
        guard let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false) else {
            fatalError("Can Not Convert String: \(string) to Data")
        }
        append(data)
    }
}

public protocol NetSessionFileProtocol {
    var fileName: String { get set }
    var data: Data { get set }
    var mimeType: String? { get set }
}

// MARK: - FileContainer

/// временный объект для хранения файлов
///
/// по-сути обертка над словарем, чтобы в checkValue этим не заниматься
private struct FileContainer {
    let fileName: String
    let data: Data
    let mimeType: String?

    init?(dictionary: [String: Any]) {
        guard let fileName = dictionary["fileName"] as? String else {
            return nil
        }

        guard let data = dictionary["data"] as? String else {
            return nil
        }

        guard let rawData = Data(base64Encoded: data) else {
            return nil
        }

        let mimeType = dictionary["dictionary"] as? String

        self.fileName = fileName
        self.data = rawData
        self.mimeType = mimeType
    }
}

// MARK: - Multipart

public class NetMultipartData {
    public var body = NSMutableData()
    private var _boundary = ""
    private var boundaryPrefix = ""
    private var finishBoundary = ""
    public var boundary: String {
        set {
            _boundary = newValue
            boundaryPrefix = "--\(newValue)\r\n"
            finishBoundary = "--\(self.boundary)--"
        }
        get { _boundary }
    }

    public init() {
        self.boundary = "Boundary-\(UUID().uuidString)"
    }

    public init(boundary: String) {
        self.boundary = boundary
    }

    public func append(_ name: String, _ value: Any) {
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
        body.appendString("\(value)\r\n")
    }

    public func appendFile(_ name: String, _ data: Data, _ fileName: String, mimeType: String) {
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(data)
        body.appendString("\r\n")
    }

    public func finalizeBodyAndGetData() -> NSMutableData {
        finalizeBody()
        return body
    }

    private func finalizeBody() {
        if !body.isEmpty {
            body.appendString(finishBoundary)
        }
    }

    public func toTelegramMultipartData(_ anyObject: [String: Any]) -> NSMutableData {
        func checkValue(_ parentName: String, _ anyObject: Any) {
            if let array = anyObject as? [Any] {
                do {
                    let data = try JSONSerialization.data(withJSONObject: array, options: [])
                    let json = String(decoding: data, as: UTF8.self)
                    append(parentName, json)
                } catch {
                    Bot.log.critical("\(error.logMessage)")
                }
            } else if let dictionary = anyObject as? [String: Any] {
                if let file = FileContainer(dictionary: dictionary) {
                    appendFile(
                        parentName,
                        file.data,
                        file.fileName,
                        mimeType: file.mimeType ?? ""
                    )
                } else if parentName.isEmpty {
                    for key in dictionary.keys {
                        let newNodeName = "\(key)"
                        checkValue(newNodeName, dictionary[key]!)
                    }
                } else {
                    do {
                        let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
                        let json = String(decoding: data, as: UTF8.self)
                        append(parentName, json)
                    } catch {
                        Bot.log.critical("\(error.logMessage)")
                    }
                }
            } else {
                append(parentName, anyObject)
            }
        }

        checkValue("", anyObject as Any)
        return finalizeBodyAndGetData()
    }
}

public extension Encodable {
    func toMultiPartFormData() throws -> (body: NSMutableData, boundary: String) {
        let encodedData = try JSONEncoder().encode(self)
        guard let dictironary: [String: Any] = try JSONSerialization
            .jsonObject(with: encodedData, options: []) as? [String: Any]
        else {
            fatalError("Not encode to dictionary \(Self.self)")
        }
        let multipart: NetMultipartData = .init()

        return (body: multipart.toTelegramMultipartData(dictironary), boundary: multipart.boundary)
    }
}
