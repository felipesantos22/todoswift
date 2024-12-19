//
//  ContentView.swift
//  todo
//
//  Created by Felipe Santos on 04/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            TaskView()
        }
    }
}
