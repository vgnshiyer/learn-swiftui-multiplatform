//
//  TabBarView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

import AppCore
import SwiftUI

struct TabBarView: View {
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var allTasks: [AppCore.Task]
    @State private var searchTerm: String = ""

    var body: some View {
        TabView {
            Tab(TaskSection.all.displayName, systemImage: TaskSection.all.iconName) {
                NavigationStack {
                    TaskListView(
                        title: TaskSection.all.displayName,
                        tasks: $allTasks
                    )
                    .navigationTitle(TaskSection.all.displayName)
                }
            }

            Tab(TaskSection.done.displayName, systemImage: TaskSection.done.iconName) {
                NavigationStack {
                    StaticTaskListView(
                        title: TaskSection.done.displayName,
                        tasks: allTasks.filter({ $0.isCompleted })
                    )
                    .navigationTitle(TaskSection.done.displayName)
                }
            }

            Tab(TaskSection.upcoming.displayName, systemImage: TaskSection.upcoming.iconName) {
                NavigationStack {
                    StaticTaskListView(
                        title: TaskSection.upcoming.displayName,
                        tasks: allTasks.filter({ !$0.isCompleted })
                    )
                    .navigationTitle(TaskSection.upcoming.displayName)
                }
            }

            Tab("Groups", systemImage: "folder") {
                GroupsNavigationView(userCreatedGroups: $userCreatedGroups)
            }

            Tab(role: .search) {
                NavigationStack {
                    StaticTaskListView(title: "Search", tasks: filteredSearchTasks)
                        .navigationTitle("Search")
                        .searchable(
                            text: $searchTerm,
                            placement: .navigationBarDrawer(displayMode: .always)
                        )
                }
            }
        }
    }

    private var filteredSearchTasks: [AppCore.Task] {
        if searchTerm.isEmpty {
            return allTasks
        }

        return allTasks.filter { task in
            task.title.localizedCaseInsensitiveContains(searchTerm)
        }
    }
}

#Preview {
    TabBarView(
        userCreatedGroups: .constant(TaskGroup.examples()),
        allTasks: .constant(AppCore.Task.examples())
    )
}
