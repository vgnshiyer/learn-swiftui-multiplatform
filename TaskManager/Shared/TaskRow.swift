//
//  TaskRow.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//


import SwiftUI
import AppCore

struct TaskView: View {
    @Binding var task: AppCore.Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField("New Task", text: $task.title)
                .textFieldStyle(.plain)
        }
    }
}
