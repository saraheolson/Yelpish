//
//  BusinessHours.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import Foundation

struct BusinessHours: Codable, Hashable {
    let businessHoursOpen: [OpenHours]
    let hoursType: String
    let isOpenNow: Bool

    enum CodingKeys: String, CodingKey {
        case businessHoursOpen = "open"
        case hoursType = "hours_type"
        case isOpenNow = "is_open_now"
    }
    
    static let example = BusinessHours(businessHoursOpen: [OpenHours.example], hoursType: "REGULAR", isOpenNow: true)
}
