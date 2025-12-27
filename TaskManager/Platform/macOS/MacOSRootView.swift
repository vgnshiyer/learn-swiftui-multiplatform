//
//  MacOSRootView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

import SwiftUI
import AppCore

struct MacOSRootView: View {
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var allTasks: [AppCore.Task]
    @State private var selection = TaskSection.all
    @State private var searchTerm: String = ""

    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
        } detail: {
            if searchTerm.isEmpty {
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .done:
                    StaticTaskListView(title: "Done", tasks: allTasks.filter({ $0.isCompleted }))
                case .upcoming:
                    StaticTaskListView(title: "Upcoming", tasks: allTasks.filter({ !$0.isCompleted }))
                case .list(let group):
                    StaticTaskListView(title: group.title, tasks: group.tasks)
                }
            } else {
                StaticTaskListView(title: "All", tasks: allTasks.filter({ $0.title.contains(searchTerm) }))
            }
        }
        .searchable(text: $searchTerm)
    }
}

#Preview {
    MacOSRootView(userCreatedGroups: .constant(TaskGroup.examples()), allTasks: .constant(AppCore.Task.examples()))
}
