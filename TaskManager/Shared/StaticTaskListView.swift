//
//  TaskListView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

import SwiftUI
import AppCore

struct StaticTaskListView: View {
    let title: String
    let tasks: [AppCore.Task]
    
    var body: some View {
        List (tasks) { task in
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                Text(task.title)
            }
        }
    }
}

#Preview {
    StaticTaskListView(title: "All", tasks: AppCore.Task.examples())
}
