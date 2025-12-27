//
//  File.swift
//  AppCore
//
//  Created by Vignesh Iyer on 12/27/25.
//

import Foundation

public enum TaskSection: Identifiable, CaseIterable, Hashable {
    case all
    case done
    case upcoming
    case list(TaskGroup)

    public var id: String {
        switch self {
        case .all:
            "All"
        case .done:
            "Done"
        case .upcoming:
            "Upcoming"
        case .list(let taskGroup):
            taskGroup.title
        }
    }

    public var displayName: String {
        switch self {
        case .all:
            "All"
        case .done:
            "Done"
        case .upcoming:
            "Upcoming"
        case .list(let taskGroup):
            taskGroup.title
        }
    }

    public var iconName: String {
        switch self {
        case .all:
            "star"
        case .done:
            "checkmark.circle"
        case .upcoming:
            "calendar"
        case .list:
            "folder"
        }
    }

    public static var allCases: [TaskSection] {
        [.all, .done, .upcoming]
    }

    public static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        lhs.id == rhs.id
    }
}
