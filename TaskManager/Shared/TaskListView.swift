//
//  TaskListView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

import SwiftUI
import AppCore

struct TaskListView: View {
    let title: String
    @Binding var tasks: [AppCore.Task]
    
    var body: some View {
        List($tasks) { $task in
            TaskView(task: $task)
        }
        .toolbar {
            Button {
                let newTask = AppCore.Task(title: "New Task")
                tasks.append(newTask)
            } label: {
                Label("Add New Task", systemImage: "plus")
            }
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(AppCore.Task.examples()))
}


