//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Shashank B on 25/02/25.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //we need to add a modifier to the WindowGroup so that SwiftData is available everywhere in our app:
        //Model Container: Manages the underlying database, creating it if necessary.
        .modelContainer(for:Student.self)
    }
}


//Create a Model: Use @Model instead of @Observable.
//Set Up the App Struct: Add modelContainer(for:) to WindowGroup.
//Query Data: Use @Query to retrieve data from SwiftData.
//Access Model Context: Use @Environment(\.modelContext) for inserting and modifying data.
//Add Data Dynamically: Create a button to insert random students into the model context.
