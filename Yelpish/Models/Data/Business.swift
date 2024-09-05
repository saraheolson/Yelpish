
import Foundation

struct Business: Codable, Hashable {
    let alias: String
    let categories: [Category]
    let coordinates: Center
    let displayPhone: String
    let distance: Double?
    let id: String
    let imageURL: String
    let isClosed: Bool
    let location: Location
    let name: String
    let phone: String
    let price: String?
    let rating: Double
    let reviewCount: Int
    let transactions: [String]
    let url: String
    let businessHours: [BusinessHours]?

    enum CodingKeys: String, CodingKey {
        case alias, categories, coordinates
        case displayPhone = "display_phone"
        case distance, id
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case location, name, phone, price, rating
        case reviewCount = "review_count"
        case transactions, url
        case businessHours = "business_hours"
    }
    
    static func == (lhs: Business, rhs: Business) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static let example = Business(
        alias: "up-thai-new-york",
        categories: [Category.example],
        coordinates: Center.init(latitude: 40.7698275926665, longitude: -73.9576330868512),
        displayPhone: "(212) 256-1188",
        distance: 7785.659824008887,
        id: "-OixbLnFLCzQclxCSbUQ8w",
        imageURL: "https://s3-media1.fl.yelpcdn.com/bphoto/DU3XrxT9Khdrq0Kpuo9t-Q/o.jpg",
        isClosed: false,
        location: Location.example,
        name: "Up Thai",
        phone: "+12122561188",
        price: "$$",
        rating: 4.4,
        reviewCount: 3236,
        transactions: [
            "pickup",
            "delivery"
        ],
        url: "https://www.yelp.com/biz/up-thai-new-york?adjust_creative=bxUy3uFa1-nn58ga0Chp8Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=bxUy3uFa1-nn58ga0Chp8Q",
        businessHours: [BusinessHours.example])
    
    static let badImageExample = Business(
        alias: "up-thai-new-york",
        categories: [Category.example],
        coordinates: Center.init(latitude: 40.7698275926665, longitude: -73.9576330868512),
        displayPhone: "(212) 256-1188",
        distance: 7785.659824008887,
        id: "-OixbLnFLCzQclxCSbUQ8w",
        imageURL: "https://s3-media1.fl.yelpcdn.com/bphoto/DU3XrxT9Khdt-Q/o.jpg",
        isClosed: false,
        location: Location.example,
        name: "Up Thai",
        phone: "+12122561188",
        price: "$$",
        rating: 4.4,
        reviewCount: 3236,
        transactions: [
            "pickup",
            "delivery"
        ],
        url: "https://www.yelp.com/biz/up-thai-new-york?adjust_creative=bxUy3uFa1-nn58ga0Chp8Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=bxUy3uFa1-nn58ga0Chp8Q",
        businessHours: [BusinessHours.example])
}
