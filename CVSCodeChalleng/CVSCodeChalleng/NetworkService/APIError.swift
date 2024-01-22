//
//  APIError.swift
//  CVSCodeChalleng
//
//  Created by Dameion Dismuke on 01/21/2024.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case urlError
    case serverNotFoundError
    case dataNotFound
}
