//
//  Category.swift
//  JobReadness
//
//  Created by Thiago Almeida Leite on 29/06/22.
//

import Foundation

struct Category: Codable {
    let categoryID: String
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
    }
}
