//
//  SearchViewModel.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import Foundation

public let TEST_SEARCH_STRING = "new york"

public enum UiState {
    case loading
    case loaded
    case error(error: Error)
}

class SearchViewModel: ObservableObject {
    @Published var businesses: [Business] = []
    @Published var uiState: UiState = .loaded
    
    init() {
        loadSearchResults(searchTerm: TEST_SEARCH_STRING)
    }
    
    func loadSearchResults(searchTerm: String) {
        self.uiState = .loading
        
        YelpAPI().search(forTerm: searchTerm) { businesses, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    self.uiState = .error(error: error!)
                    print("Error calling search API: \(String(describing: error))")
                    return
                }
                self.businesses = businesses ?? []
                
                self.uiState = .loaded
            }
        }
    }
}
