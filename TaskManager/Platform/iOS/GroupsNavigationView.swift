//
//  GroupsNavigationView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

import SwiftUI
import AppCore

struct GroupsNavigationView: View {
    @Binding var userCreatedGroups: [TaskGroup]

    var body: some View {
        NavigationStack {
            List {
                ForEach($userCreatedGroups) { $group in
                    GroupRow(group: $group)
                }
            }
            .navigationTitle("Groups")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let newGroup = TaskGroup(title: "New Group")
                        userCreatedGroups.append(newGroup)
                    } label: {
                        Label("Create Group", systemImage: "plus")
                    }
                }
            }
            .navigationDestination(for: TaskGroup.self) { group in
                StaticTaskListView(title: group.title, tasks: group.tasks)
                    .navigationTitle(group.title)
            }
        }
    }
}

#Preview {
    GroupsNavigationView(userCreatedGroups: .constant(TaskGroup.examples()))
}

private struct GroupRow: View {
    @Binding var group: TaskGroup
    @State private var isRenaming = false

    var body: some View {
        NavigationLink(value: group) {
            Label(group.title, systemImage: "folder")
        }
        .swipeActions(edge: .trailing) {
            Button {
                isRenaming = true
            } label: {
                Label("Rename", systemImage: "pencil")
            }
            .tint(.blue)
        }
        .alert("Rename Group", isPresented: $isRenaming) {
            TextField("Group name", text: $group.title)
            Button("Done", role: .cancel) {}
        }
    }
}
