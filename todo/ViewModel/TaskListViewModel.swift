//
//  TaskListViewModel.swift
//  todo
//
//  Created by Felipe Santos on 04/12/24.
//

import SwiftUI
import SwiftData

class TaskListViewModel: ObservableObject {
    @Published private(set) var tasks: [TaskModel] = []
    
    func addItem(_ task: String, context: ModelContext) {
        let task = TaskModel(task: task)
        context.insert(task) // Insere a nova tarefa no contexto
        
        do {
            try context.save() // Salva as alterações no banco de dados
            print("Saved context")
            tasks.append(task) // Atualiza a lista de tarefas localmente
        } catch {
            print("Failed to save context: \(error.localizedDescription)")
        }
    }
    
    func deleteItem(_ task: TaskModel, context: ModelContext) {
        context.delete(task)
        try? context.save()
    }
    
    func editTask(_ task: TaskModel, newItem: String) {
        task.task = newItem
    }
}
