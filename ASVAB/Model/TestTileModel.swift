import Foundation

// Заглушка модели категории
struct TestTileModel: Identifiable {
    let id = UUID()
    let text: String
    let imageName: String
    let progressCircle: Double
    let progressCount: String
    let progressTests: String
}

