//
//  YelpAPI.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import Foundation

protocol API {
    func search(forTerm term: String, completion: @escaping ([Business]?, Error?) -> Void)
    func getBusinessDetails(withId businessId: String, completion: @escaping (Business?, Error?) -> Void)
}

class YelpAPI: API {
    
    func search(forTerm term: String, completion: @escaping ([Business]?, Error?) -> Void) {
        DataLoader.shared.request(.search(term: term)) { result in
            switch (result) {
            case .success (let data):
                do {
                    let json = try JSONDecoder().decode(SearchResponse.self, from: data)
                    completion(json.businesses, nil)
                } catch {
                    print("JSON decoding Error: \(error)")
                    completion(nil, APIError.jsonDecodingError(error))
                }
            case .failure (let error):
                completion(nil, error)
            }
        }
    }

    func getBusinessDetails(withId businessId: String, completion: @escaping (Business?, Error?) -> Void) {
        DataLoader.shared.request(.businessDetails(withId: businessId)) { result in
            switch (result) {
            case .success (let data):
                do {
                    let json = try JSONDecoder().decode(Business.self, from: data)
                    completion(json, nil)
                } catch {
                    completion(nil, APIError.jsonDecodingError(error))
                }
            case .failure (let error):
                completion(nil, error)
            }
        }
    }
}

