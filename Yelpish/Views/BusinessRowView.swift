//
//  BusinessRowView.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import SwiftUI

struct BusinessRowView: View {
    let business: Business
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: business.imageURL)) { phase in
                
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100, alignment: .topLeading)
                        .clipped()
                } else if phase.error != nil {
                    Image(systemName: "photo")
                        .imageScale(.large)
                        .tint(.gray)
                } else {
                    ProgressView()
                        .font(.largeTitle)
                }
            }
            .padding()
            
            Text(business.name)
                .font(.headline)
                .fontWeight(.bold)
            RatingView(rating: business.rating.toInt())
            Text("Rating \(business.rating.formatted(.number.precision(.fractionLength(1))))")
            Text("Is closed? \(business.isClosed)")
        }
    }
}

#Preview {
    List {
        BusinessRowView(business: Business.example)
        BusinessRowView(business: Business.badImageExample)
    }
}
