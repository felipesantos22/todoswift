//
//  TaskView.swift
//  todo
//
//  Created by Felipe Santos on 13/12/24.
//

import SwiftUI
import SwiftData

struct TaskView: View {
    
    @Query(sort: \TaskModel.timestamp, order: .forward) private var tasks: [TaskModel]
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
            
            List(tasks) { task in
                HStack {
                    Text(task.task)
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
        .padding()
    }
}
