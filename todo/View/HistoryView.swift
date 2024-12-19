//
//  HistoryView.swift
//  todo
//
//  Created by Felipe Santos on 13/12/24.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    
    @Query(sort: \TaskModel.timestamp, order: .forward) private var tasks: [TaskModel]
    
    var body: some View {
        VStack {
            Text("Histórico de Tarefas")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            if tasks.isEmpty {
                Text("Nenhum resultado disponível.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            } else {
                List(tasks) { result in
                    VStack(alignment: .leading) {
                        Text("ID: \(result.id) Id")
                            .font(.subheadline)
                        Text("Tarefa: \(result.task)")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text("Data: \(result.timestamp)")
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                    }
                    .padding()
                }
            }
        }
        .padding()
    }
}

#Preview {
    HistoryView()
}
