//
//  Task.swift
//  todo
//
//  Created by Felipe Santos on 04/12/24.
//

import SwiftData

@Model
class Task{
    @Attribute(.unique) var item: String
    init(item: String) {
        self.item = item
    }
}

//class Task: ObservableObject, Identifiable {
//    let id = UUID()
//    let item: String
//    var timestamp: Date
//    
//    init(item: String, timestamp: Date) {
//        self.item = item
//        self.timestamp = timestamp
//    }
//}
