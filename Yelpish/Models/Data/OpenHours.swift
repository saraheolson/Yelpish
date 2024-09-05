//
//  OpenHours.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import Foundation

struct OpenHours: Codable, Hashable {
    let isOvernight: Bool
    let start: String
    let end: String
    let day: Int

    var dayOfWeek: String {
        Calendar.current.weekdaySymbols[day]
    }
    
    enum CodingKeys: String, CodingKey {
        case isOvernight = "is_overnight"
        case start, end, day
    }
    
    static let example = OpenHours(isOvernight: false, start: "1130", end: "2200", day: 0)
    static let mondayExample = OpenHours(isOvernight: false, start: "1130", end: "2000", day: 1)
    static let tuesdayExample = OpenHours(isOvernight: false, start: "1130", end: "1800", day: 2)
}
