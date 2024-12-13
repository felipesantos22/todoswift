//
//  Task.swift
//  todo
//
//  Created by Felipe Santos on 04/12/24.
//

import SwiftUI
import SwiftData

@Model
class TaskModel: Identifiable {
    
    var id: UUID
    var task: String
    var timestamp: Date
    
    init(task: String, timestamp: Date = Date()) {
        self.id = UUID()
        self.task = task
        self.timestamp = timestamp
    }
}
