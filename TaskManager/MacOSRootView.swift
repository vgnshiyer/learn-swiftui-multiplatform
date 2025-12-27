//
//  MacOSRootView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

#if os(macOS)
import SwiftUI
import AppCore

struct MacOSRootView: View {
    let userCreatedGroups: [TaskGroup]
    let allTasks: [AppCore.Task]
    @State private var selection = TaskSection.all

    var body: some View {
        NavigationSplitView {
            SidebarView(userCreatedGroups: userCreatedGroups, selection: $selection)
        } detail: {
            switch selection {
            case .all:
                TaskListView(title: "All", tasks: allTasks)
            case .done:
                TaskListView(title: "Done", tasks: allTasks.filter({ $0.isCompleted }))
            case .upcoming:
                TaskListView(title: "Upcoming", tasks: allTasks.filter({ !$0.isCompleted }))
            case .list(let group):
                TaskListView(title: group.title, tasks: group.tasks)
            }
        }
    }
}

#Preview {
    MacOSRootView(userCreatedGroups: TaskGroup.examples(), allTasks: AppCore.Task.examples())
}
#endif
