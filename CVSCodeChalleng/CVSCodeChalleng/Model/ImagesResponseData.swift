//
//  ImagesResponseData.swift
//  CVSCodeChalleng
//
//  Created by Dameion Dismuke on 01/21/2024.
//

import Foundation

// MARK: - ImagesResponseData
struct ImagesResponseData: Decodable {
    let title: String
//    let link: String
//    let description: String
//    let modified: Date
//    let generator: String
    let items: [Item]
}

// MARK: - Item
struct Item: Decodable {
    let title: String
    let link: String
    let media: Media
    let dateTaken: String
    let description,published: String
    let author, authorID, tags: String

    enum CodingKeys: String, CodingKey {
        case title, link, media
        case dateTaken = "date_taken"
        case description,published, author
        case authorID = "author_id"
        case tags
    }
}

extension Item:Identifiable{
    var id: String {
        return dateTaken
    }
}

// MARK: - Media
struct Media: Decodable {
    let m: String
}
