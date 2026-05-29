import SwiftUI

// Заглушка экрана теста
struct ExaminationTestsView: View {
    let category: TestTileModel
    var body: some View {
        Text("Начался тест по: \(category.text)")
            .font(.title)
            .padding()
    }
}

//#Preview {
//    TestViewPractice(category: .init(title: "123", imageName: "home", progressCircle: 0.5))
//}
