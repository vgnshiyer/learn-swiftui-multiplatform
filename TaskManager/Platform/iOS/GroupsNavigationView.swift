//
//  GroupsNavigationView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

import SwiftUI
import AppCore

struct GroupsNavigationView: View {
    let userCreatedGroups: [TaskGroup]

    var body: some View {
        NavigationStack {
            List(userCreatedGroups) { group in
                NavigationLink(value: group) {
                    Label(group.title, systemImage: "folder")
                }
            }
            .navigationTitle("Groups")
            .navigationDestination(for: TaskGroup.self) { group in
                TaskListView(title: group.title, tasks: group.tasks)
                    .navigationTitle(group.title)
            }
        }
    }
}

#Preview {
    GroupsNavigationView(userCreatedGroups: TaskGroup.examples())
}
