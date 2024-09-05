//
//  DataLoader.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case networkConnectionLost
    case networkTimeout
    case serverError
    case authenticationError
    case badData
    case jsonDecodingError(_ error: Error?)
    case network(_ error: Error?)
}

class DataLoader {
    static let shared = DataLoader()
    
    func request(_ endpoint: Endpoint,
                 then handler: @escaping (Result<Data, APIError>) -> Void) {
        guard let url = endpoint.url else {
            return handler(.failure(APIError.invalidURL))
        }
        print("URL: \(url)")
        var request = URLRequest(url: url)
        request.setValue("Bearer M4fLCxWvNS8YUP3LHDvahN2ppxOjMpfjTYAT9H0y5jheLEKCol5q6_AuSW17BmnTQEjUFfQRDA6Wpa5vzo_uZC_Ykvg38T_vuWpL7hgmgNpLC53NKjZe8UjOFvGoYnYx", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "accept")

        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in

            if let error = error {
                    switch (error as NSError).code {
                    case NSURLErrorNetworkConnectionLost:
                        handler(.failure(APIError.networkConnectionLost))
                    case NSURLErrorTimedOut:
                        handler(.failure(APIError.networkTimeout))
                    case 400...499:
                        handler(.failure(APIError.authenticationError))
                    case 500...599:
                        handler(.failure(APIError.serverError))
                    default:
                        handler(.failure(APIError.network(error)))
                    }
            } else {
                if let data = data {
                    handler(.success(data))
                } else {
                    handler(.failure(APIError.badData))
                }
            }
        }
        task.resume()
    }
}
