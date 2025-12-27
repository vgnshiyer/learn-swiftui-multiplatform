//
//  IOSRootView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

import SwiftUI
import AppCore

struct IOSRootView: View {
    let userCreatedGroups: [TaskGroup]
    let allTasks: [AppCore.Task]

    var body: some View {
        TabBarView(userCreatedGroups: userCreatedGroups, allTasks: allTasks)
    }
}

#Preview {
    IOSRootView(userCreatedGroups: TaskGroup.examples(), allTasks: AppCore.Task.examples())
}
