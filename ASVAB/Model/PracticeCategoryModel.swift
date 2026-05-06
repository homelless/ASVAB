import Foundation

// Заглушка модели категории
struct PracticeCategory: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let progressCircle: Double
    let progressCount: String
}

