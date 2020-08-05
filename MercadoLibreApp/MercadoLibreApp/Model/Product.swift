//
//  Product.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import Foundation

struct QueryResult: Codable {
    var site_id: String
    var query: String
    var results: [Product]
}

struct Product: Codable {
    var id: String
    var title: String
    var price: Double
    var thumbnail: String
    var imageData: Data?
    var condition: String
    var seller: Seller
    var currency_id: String
}

struct Seller: Codable {
    var seller_reputation: SellerReputation
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
