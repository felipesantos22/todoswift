//
//  todoApp.swift
//  todo
//
//  Created by Felipe Santos on 04/12/24.
//

import SwiftData
import SwiftUI

@main
struct todoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [TaskModel.self]) 
    }
}
