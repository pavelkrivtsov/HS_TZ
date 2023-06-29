//
//  Models.swift
//  HS_TZ
//
//  Created by Pavel Krivtsov on 28.06.2023.
//

import Foundation

struct DataModel: Decodable, Hashable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    var category: Category
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, description, category, image
    }
}

enum Category: String, Decodable, CaseIterable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case mensClothing = "men's clothing"
    case womensClothing = "women's clothing"
}
