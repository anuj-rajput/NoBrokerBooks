//
//  Book.swift
//  NoBrokerBooks
//
//  Created by Anuj Rajput on 04/09/19.
//  Copyright © 2019 NoBroker. All rights reserved.
//

import Foundation

//{
//    "id": "ISBN6",
//    "book_title": "Icky Thump",
//    "author_name": "Arundhati Roy",
//    "genre": "FICTION",
//    "publisher": "Penguin",
//    "author_country": "INDIA",
//    "sold_count": 2007,
//    "image_url": "https://marketplace.canva.com/MACVuAgAxtQ/1/0/thumbnail_large/canva-violet-graphic-design-book-cover-MACVuAgAxtQ.jpg"
//}

struct Book {
    let id: String
    let title: String
    let author: String
    let genre: String
    let publisher: String
    let country: String
    let sold: Int
    let imageURL: URL
}

extension Book: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title = "book_title"
        case author = "author_name"
        case genre
        case publisher
        case country = "author_country"
        case sold = "sold_count"
        case imageURL = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        author = try values.decode(String.self, forKey: .author)
        genre = try values.decode(String.self, forKey: .genre)
        publisher = try values.decode(String.self, forKey: .publisher)
        country = try values.decode(String.self, forKey: .country)
        sold = try values.decode(Int.self, forKey: .sold)
        imageURL = try values.decode(URL.self, forKey: .imageURL)
    }
}

extension Book: Equatable {
    
    static func ==(lhs: Book, rhs: Book) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.author == rhs.author
    }
}
