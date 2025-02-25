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
        .modelContainer(for:Book.self)
    }
}
