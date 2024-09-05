//
//  BusinessViewModel.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import Foundation

class BusinessViewModel: ObservableObject {
    @Published var business: Business
    @Published var uiState: UiState = .loading

    init(business: Business) {
        self.business = business
        
        loadBusinessDetails()
    }
    
    func loadBusinessDetails() {
        YelpAPI().getBusinessDetails(withId: self.business.id) { business, error in
            DispatchQueue.main.async {
                guard let business = business,
                        error == nil else {
                    self.uiState = .error(error: error!)
                    print("Error calling business details API: \(String(describing: error))")
                    return
                }
                self.business = business
                
                self.uiState = .loaded
            }
        }
    }
}
