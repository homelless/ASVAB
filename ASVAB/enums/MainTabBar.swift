import SwiftUI

enum MainTab: Int, CaseIterable {
    case study, tests, stats, settings
    
    var title: String {
        switch self {
        case .study: return "Study"
        case .tests: return "Tests"
        case .stats: return "Stats"
        case .settings: return "Settings"
        }
    }
    
    var icon: String {
        switch self {
        case .study: return "study"
        case .tests: return "tests"
        case .stats: return "stats"
        case .settings: return "settings"
        }
    }
    var iconSelected: String {
        switch self {
        case .study: return "studySelected"
        case .tests: return "testsSelected"
        case .stats: return "statsSelected"
        case .settings: return "settingsSelected"
        }
    }
}
