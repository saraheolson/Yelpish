//
//  Endpoint.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import Foundation

import Foundation

struct Endpoint {
    let endpointPath: String
    let queryItems: [URLQueryItem]
    
    let baseUrl = "https://api.yelp.com/v3/businesses"
    let basePath = "/v3/businesses"
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.yelp.com"
        components.path = basePath + endpointPath
        components.queryItems = queryItems

        return components.url
    }
}

extension Endpoint {
    static func search(term: String) -> Endpoint {
        let queryItem = URLQueryItem(name: "location", value: term)
        return Endpoint(
            endpointPath: "/search",
            queryItems: [queryItem]
        )
    }
    
    static func businessDetails(withId id: String) -> Endpoint {
        return Endpoint(
            endpointPath: "/\(id)",
            queryItems: []
        )
    }
}
