//
//  Category.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import Foundation

// MARK: - Category
struct Category: Codable {
    let alias, title: String
    
    static let example = Category(alias: "thai", title: "Thai")
}
