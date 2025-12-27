//
//  TabBarView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

import SwiftUI
import AppCore

struct TabBarView: View {
    @Binding var userCreatedGroups: [TaskGroup]
    let allTasks: [AppCore.Task]

    var body: some View {
        TabView {
            TaskListView(title: TaskSection.all.displayName, tasks: allTasks)
                .tabItem {
                    Label(TaskSection.all.displayName, systemImage: TaskSection.all.iconName)
                }

            TaskListView(title: TaskSection.done.displayName, tasks: allTasks.filter({ $0.isCompleted }))
                .tabItem {
                    Label(TaskSection.done.displayName, systemImage: TaskSection.done.iconName)
                }

            TaskListView(title: TaskSection.upcoming.displayName, tasks: allTasks.filter({ !$0.isCompleted }))
                .tabItem {
                    Label(TaskSection.upcoming.displayName, systemImage: TaskSection.upcoming.iconName)
                }

            GroupsNavigationView(userCreatedGroups: $userCreatedGroups)
                .tabItem {
                    Label("Groups", systemImage: "folder")
                }
        }
    }
}

#Preview {
    TabBarView(userCreatedGroups: .constant(TaskGroup.examples()), allTasks: AppCore.Task.examples())
}
