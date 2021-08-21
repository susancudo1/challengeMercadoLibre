//
//  Product.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import Foundation

struct QueryResult: Codable {
    var siteId: String
    var query: String
    var results: [Product]

    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case query = "query"
        case results = "results"
    }
}

struct Product: Codable {
    var ident: String
    var title: String
    var price: Double
    var thumbnail: String
    var imageData: Data?
    var condition: String
    var seller: Seller
    var currencyId: String

    enum CodingKeys: String, CodingKey {
        case ident = "id"
        case title = "title"
        case price = "price"
        case thumbnail = "thumbnail"
        case imageData = "imageData"
        case condition = "condition"
        case seller = "seller"
        case currencyId = "currency_id"
    }
}

struct Seller: Codable {
    var sellerReputation: SellerReputation

    enum CodingKeys: String, CodingKey {
        case sellerReputation = "seller_reputation"
    }
}

struct SellerReputation: Codable {
    var transactions: Transactions
}

struct Transactions: Codable {
    var ratings: Ratings
    var completed: Int
}

struct Ratings: Codable {
    var positive: Double
}
