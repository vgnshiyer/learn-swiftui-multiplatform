//
//  File.swift
//  AppCore
//
//  Created by Vignesh Iyer on 12/27/25.
//

import Foundation

enum TaskSection: Identifiable, CaseIterable, Hashable {
    case all
    case done
    case upcoming
    case list(TaskGroup)
    
    var id: String {
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
    
    var iconName: String {
        switch self {
        case .all:
            "start"
        case .done:
            "checkmark.circle"
        case .upcoming:
            "calendar"
        case .list:
            "folder"
        }
    }
    
    static var allCases: [TaskSection] {
        [.all, .done, .upcoming]
    }
    
    static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        lhs.id == rhs.id
    }
}
