//
//  ResultItem.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 29/06/22.
//

import Foundation

struct CategoryResponse: Codable {
    let code: Int
    let body: ItemFromCategory
}

struct ItemFromCategory: Codable {
    let id: String
    let pictures: [ResultPicture]
    let title: String
    let subtitle: String?
    let price: Double
    
}

struct ResultPicture: Codable {
    let secure_url: String
}


