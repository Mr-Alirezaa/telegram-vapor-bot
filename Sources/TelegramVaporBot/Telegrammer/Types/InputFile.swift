//
//  InputFile.swift
//
//

//

import Foundation
import Vapor

public struct InputFile: Encodable {
    var fileName: String
    var data: Data
    var mimeType: String?

    public init(filename: String, data: Data, mimeType: String? = nil) {
        self.data = data
        self.fileName = filename
        self.mimeType = mimeType
    }
}


extension InputFile: MultipartPartConvertible {

    public var multipart: MultipartPart? {
        guard let multipartData = data.multipart else {
            return nil
        }

        var multipart = MultipartPart(body: multipartData.body)
        multipart.filename = self.fileName
        return multipart
    }

    public init?(multipart: MultipartPart) {
        guard
            let fileName = multipart.filename,
            let data = Data(multipart: multipart)
        else {
            return nil
        }
        self.fileName = fileName
        self.data = data
        self.mimeType = multipart.headers["Content-Type"].first
    }
}
