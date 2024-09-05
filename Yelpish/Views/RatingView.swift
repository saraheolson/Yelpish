//
//  RatingView.swift
//  Yelpish
//
//  Created by Sarah Olson on 9/4/24.
//

import SwiftUI

/*
 * Grabbed this from a Hacking with Swift post, for fun. ;-)
 * https://www.hackingwithswift.com/books/ios-swiftui/adding-a-custom-star-rating-component
 */
struct RatingView: View {
    
    @State var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack(spacing: 1) {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: 4)
}

// The rating we get from the API is a Double, so convert to Int by rounding DOWN
// otherwise anything >4.5 and above would be a 5* rating
extension Double {
    func toInt() -> Int {
        let roundedValue = rounded(.down)
        return Int(exactly: roundedValue) ?? 0
    }
}
