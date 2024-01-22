//
//  FakeNetworkManager.swift
//  CVSCodeChallengTests
//
//  Created by Dameion Dismuke on 01/21/2024.
//

import Foundation
@testable import CVSCodeChalleng

class FakeNetworkManager: NetworkingProtocol {
    func get<T>(apiURL: String, type: T.Type) async throws -> T where T : Decodable {
        if apiURL.isEmpty {
            throw APIError.urlError
        }
        return ImagesResponseData.imageResponseData as! T
    }
}

extension ImagesResponseData {
    static var imageResponseData: ImagesResponseData {
        ImagesResponseData(title:"", items: [Item(title: "", link: "", media: Media(m: ""), dateTaken: "", description: "", published: "", author: "", authorID: "", tags: "")])
    }
}
