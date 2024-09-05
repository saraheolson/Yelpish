//
//  Location.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import Foundation

struct Location: Codable {
    let address1: String
    let address2: String?
    let address3: String?
    let city: String
    let country: String
    let displayAddress: [String]
    let state, zipCode: String
    let crossStreets: String?

    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city, country
        case displayAddress = "display_address"
        case state
        case zipCode = "zip_code"
        case crossStreets = "cross_streets"
    }
    
    static let example = Location(
        address1: "1411 2nd Ave",
        address2: "",
        address3: "",
        city: "New York",
        country: "US",
        displayAddress: [
            "1411 2nd Ave",
            "New York, NY 10021"
        ],
        state: "NY",
        zipCode: "10021",
        crossStreets: "73rd St & 74th St"
    )
}
