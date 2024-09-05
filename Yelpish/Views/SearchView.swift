//
//  Search.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel: SearchViewModel

    @State private var isFinished = false
    @State private var searchText = TEST_SEARCH_STRING

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.businesses, id: \.self) { business in
                    NavigationLink(value: business) {
                        BusinessRowView(business: business)
                    }
                }
            }
            .navigationDestination(for: Business.self) { business in
                BusinessDetailView(viewModel: BusinessViewModel(business: business))
            }
            .navigationTitle("Search")
        }
        .searchable(text: $searchText)
        .onSubmit(of: .search) {
            viewModel.loadSearchResults(searchTerm: searchText)
        }
        .overlay {
            if viewModel.businesses.isEmpty {
                if case .loaded = viewModel.uiState {
                    NoResultsView()
                } else {
                    ResultsLoadingView()
                }
            }
        }
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
