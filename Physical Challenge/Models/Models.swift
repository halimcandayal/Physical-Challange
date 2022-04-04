//
//  Models.swift
//  Physical Challenge
//
//  Created by Halimcan Dayal on 30.03.2022.
//

import Foundation

struct ProductModel: Codable {
    
    var response: [Product]?
}

struct Product: Codable {
    
    var categoryName: String?
    var products: [ProductDetails]?
}

struct ProductDetails: Codable {
    
    var name: String?
    var imageName: String?
    var description: String?
}
