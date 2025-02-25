//
//  RatingView.swift
//  Bookworm
//
//  Created by Shashank B on 25/02/25.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    var body: some View {
        HStack {
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
        //That makes SwiftUI treat each button individually, so everything works as planned. And the result is much nicer to use: there’s no need to tap into a detail view with a picker here, because star ratings are more natural and more common.
        //We can disable the whole "tap the row to trigger its buttons" behavior with an extra modifier attached to the whole HStack:
        .buttonStyle(.plain)

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
    RatingView(rating: .constant(4))
}
