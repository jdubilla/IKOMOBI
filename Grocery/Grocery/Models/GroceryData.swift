//
//  DataModels.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import Foundation

struct GroceryData: Decodable {
    let banner: Banner
    let categories: [Category]
    let products: [Product]
}

struct Banner: Decodable {
    let image: String
}

struct Category: Decodable {
    let id: Int
    let name: String
    let image: String
}

struct Product: Decodable {
    let id: Int
    let name: String
    let price: Double
    let image: String
    let packaging: Packaging
}

struct Packaging: Decodable {
    let unit: String
    let measure: Double
}
