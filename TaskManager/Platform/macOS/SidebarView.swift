//
//  SidebarView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

import SwiftUI
import AppCore

struct SidebarView: View {
    let userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection

    var body: some View {
        List(selection: $selection) {
            ForEach(AppCore.TaskSection.allCases, id: \.id) { section in
                Label(section.displayName, systemImage: section.iconName)
                    .tag(section)
            }

            Section("Your Groups") {
                ForEach(userCreatedGroups) { group in
                    Label(group.title, systemImage: "folder")
                        .tag(TaskSection.list(group))
                }
            }
        }
    }
}

#Preview {
    SidebarView(userCreatedGroups: TaskGroup.examples(), selection: .constant(.all))
        .listStyle(.sidebar)
}
