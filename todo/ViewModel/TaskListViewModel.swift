//
//  TaskListViewModel.swift
//  todo
//
//  Created by Felipe Santos on 04/12/24.
//



import SwiftUI
import SwiftData

class TaskListViewModel: ObservableObject {
    @Published private(set) var tasks: [Task] = []

    func addItem(_ item: String, context: ModelContext) {
        let task = Task(item: item)
        context.insert(task) // Insere a nova tarefa no contexto
        
        do {
            try context.save() // Salva as alterações no banco de dados
            tasks.append(task) // Atualiza a lista de tarefas localmente
        } catch {
            print("Failed to save context: \(error.localizedDescription)")
        }
    }

    func deleteItem(_ task: Task, context: ModelContext) {
        context.delete(task)
        tasks.removeAll { $0.id == task.id }
    }
    
    func editTask(_ task: Task, newItem: String) {
        task.item = newItem
    }

    func fetchTasks(context: ModelContext) {
        let descriptor = FetchDescriptor<Task>()
        tasks = try! context.fetch(descriptor) 
    }

}
