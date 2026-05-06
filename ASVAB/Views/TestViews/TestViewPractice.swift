import SwiftUI

// Заглушка экрана теста
struct TestViewPractice: View {
    let category: PracticeCategory
    var body: some View {
        Text("Начался тест по: \(category.title)")
            .font(.title)
            .padding()
    }
}

//#Preview {
//    TestViewPractice(category: .init(title: "123", imageName: "home", progressCircle: 0.5))
//}
