//
//  ContentView.swift
//  TaskManager
//
//  Created by Vignesh Iyer on 12/27/25.
//

import SwiftUI
import AppCore

struct ContentView: View {
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    @State private var allTasks: [AppCore.Task] = AppCore.Task.examples()

    var body: some View {
        PlatformRootView(userCreatedGroups: $userCreatedGroups, allTasks: $allTasks)
    }
}

#Preview {
    ContentView()
}
