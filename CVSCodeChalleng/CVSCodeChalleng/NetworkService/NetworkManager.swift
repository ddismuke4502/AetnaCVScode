//
//  NetworkManager.swift
//  CVSCodeChalleng
//
//  Created by Dameion Dismuke on 01/21/2024.
//

import Foundation

protocol JsonDecoder {
    func decode<T: Decodable>(type: T.Type, data: Data) throws -> T
}

extension JsonDecoder {
    func decode<T>(type: T.Type, data: Data) throws -> T where T : Decodable {
        return try JSONDecoder().decode(type.self, from: data)
    }
}

protocol NetworkingProtocol {
    func get<T: Decodable>(apiURL: String, type: T.Type) async throws -> T
}


struct NetworkManager {
    private let shared: URLSession
    init(shared: URLSession = URLSession.shared) {
        self.shared = shared
    }
}

extension NetworkManager: NetworkingProtocol, JsonDecoder {
    func get<T>(apiURL: String, type: T.Type) async throws -> T where T : Decodable {
        guard let url = URL(string: apiURL) else {
            throw APIError.urlError
        }
        let (data, _) = try await URLSession.shared.data(from: url)
       return try decode(type:type, data: data)
    }
}
