//
//  ContentView.swift
//  Bookworm
//
//  Created by Shashank B on 25/02/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //we need a new property to access the model context that was created earlier.
//    The model context is the “live” data environment in SwiftData.
//    It holds in-memory changes until they are saved to the database.
//    Automatically created by SwiftData when using modelContainer().
//    Accessible via @Environment(\.modelContext) in SwiftUI.
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                    //we literally just hand-created the arrays to have values – it will always succeed. If you desperately hate force unwraps, perhaps replace them with nil coalescing and default values.
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!

                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
