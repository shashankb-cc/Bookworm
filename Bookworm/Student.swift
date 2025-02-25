//
//  Student.swift
//  Bookworm
//
//  Created by Shashank B on 25/02/25.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
