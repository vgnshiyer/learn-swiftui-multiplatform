//
//  File.swift
//  AppCore
//
//  Created by Vignesh Iyer on 12/27/25.
//

import Foundation

public struct TaskGroup: Identifiable, Hashable {
    public let id: UUID
    public var title: String
    public let creationDate: Date
    public var tasks: [Task]

    public init(title: String, tasks: [Task] = []) {
        self.id = UUID()
        self.title = title
        self.creationDate = Date()
        self.tasks = tasks
    }

    public static func example() -> TaskGroup {
        let task1 = Task(title: "Buy groceries")
        let task2 = Task(title: "Finish project")
        let task3 = Task(title: "Call dentist")

        var group = TaskGroup(title: "Personal")
        group.tasks = [task1, task2, task3]
        return group
    }

    public static func examples() -> [TaskGroup] {
        let group1 = TaskGroup.example()
        let group2 = TaskGroup(title: "New list")
        return [group1, group2]
    }
}
