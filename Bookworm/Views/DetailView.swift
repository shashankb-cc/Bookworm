//
//  DetailView.swift
//  Bookworm
//
//  Created by Shashank B on 25/02/25.
//

import SwiftUI
import SwiftData


struct DetailView: View {
    let book: Book

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ZStack(alignment: .bottomTrailing) {
                    Image(book.genre)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(16)
                        .shadow(radius: 8)

                    Text(book.genre.uppercased())
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -10, y: -10)
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 8) {
                    Text(book.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)

                    Text("by \(book.author)")
                        .font(.title2)
                        .foregroundStyle(.secondary)

                    Divider()

                    Text("Review")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(book.review)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)

                    RatingView(rating: .constant(book.rating))
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4)

        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
