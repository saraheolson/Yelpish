//
//  BusinessDetailView.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import SwiftUI

struct BusinessDetailView: View {
    @StateObject var viewModel: BusinessViewModel
    
    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: 8
            ) {
                AsyncImage(url: URL(string: viewModel.business.imageURL)) { phase in
                    
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300, alignment: .center)
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
                
                HStack(spacing: 8) {
                    Text(viewModel.business.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    if viewModel.business.isClosed {
                        Text("OPEN")
                            .foregroundStyle(.green)
                            .font(.caption)
                            .fontWeight(.bold)
                    } else {
                        Text("CLOSED")
                            .foregroundStyle(.red)
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                }
                HStack(spacing: 8) {
                    RatingView(rating: viewModel.business.rating.toInt())
                    Text("( \(viewModel.business.rating.formatted(.number.precision(.fractionLength(1)))))")
                }
                Spacer()
                ForEach(viewModel.business.location.displayAddress, id: \.self) { line in
                    Text(line)
                }
                if let crossStreets = (viewModel.business.location.crossStreets) {
                    Text("Cross streets: \(crossStreets)")
                        .italic()
                        .font(.caption)
                }
                Spacer()
                HStack(spacing: 8) {
                    Image(systemName: "phone")
                    Text(viewModel.business.phone)
                }
                Spacer()
                if let businessDays = viewModel.business.businessHours {
                    Text("Hours")
                        .bold()
                    ForEach(businessDays, id: \.self) { day in
                        ForEach(day.businessHoursOpen, id: \.self) { hour in
                            HStack(spacing: 3) {
                                Text("\(hour.dayOfWeek): \(hour.start) - \(hour.end)")
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
        }
    }
}

#Preview {
    BusinessDetailView(viewModel: BusinessViewModel(business: Business.example))
}
