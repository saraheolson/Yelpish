//
//  SearchResponse.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import Foundation

struct SearchResponse: Codable {
    let businesses: [Business]
    let region: Region
    let total: Int
}
