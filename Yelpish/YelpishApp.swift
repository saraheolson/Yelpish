//
//  YelpishApp.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import SwiftUI

@main
struct YelpishApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel())
        }
    }
}
