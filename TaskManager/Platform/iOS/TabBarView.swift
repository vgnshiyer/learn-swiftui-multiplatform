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
    @Binding var allTasks: [AppCore.Task]

    var body: some View {
        TabView {
            NavigationStack {
                TaskListView(title: TaskSection.all.displayName, tasks: $allTasks)
                    .navigationTitle(TaskSection.all.displayName)
            }
            .tabItem {
                Label(TaskSection.all.displayName, systemImage: TaskSection.all.iconName)
            }

            NavigationStack {
                StaticTaskListView(title: TaskSection.done.displayName, tasks: allTasks.filter({ $0.isCompleted }))
                    .navigationTitle(TaskSection.done.displayName)
            }
            .tabItem {
                Label(TaskSection.done.displayName, systemImage: TaskSection.done.iconName)
            }

            NavigationStack {
                StaticTaskListView(title: TaskSection.upcoming.displayName, tasks: allTasks.filter({ !$0.isCompleted }))
                    .navigationTitle(TaskSection.upcoming.displayName)
            }
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
    TabBarView(userCreatedGroups: .constant(TaskGroup.examples()), allTasks: .constant(AppCore.Task.examples()))
}
