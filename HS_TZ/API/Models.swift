//
//  Models.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 28.06.2023.
//

import Foundation

//struct MenuItem: Decodable {
//    let name: String
//    let description: String
//    let price: String
//    let image: URL
//    let category: Category
//}
//
//enum Category: String, CaseIterable, Decodable {
//    case pizza, combo , drink , desert, other
//}

struct DataModel: Codable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    var category: Category
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case description = "description"
        case category, image
    }
}

enum Category: String, Codable, CaseIterable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case mensClothing = "men's clothing"
    case womensClothing = "women's clothing"
}
