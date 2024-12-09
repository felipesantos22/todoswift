//
//  ContentView.swift
//  todo
//
//  Created by Felipe Santos on 04/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = TaskListViewModel()
    @State private var newTaskName: String = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Tarefa", text: $newTaskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    if !newTaskName.isEmpty {
                        viewModel.addItem(newTaskName, context: context)
                        newTaskName = ""
                    }
                }) {
                    Text("Adicionar")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()

            List(viewModel.tasks) { task in
                HStack {
                    Text(task.item)
                    Spacer()
                    Button(action: {
                        viewModel.deleteItem(task, context: context) 
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchTasks(context: context)
        }
        .padding()
    }
}



#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
