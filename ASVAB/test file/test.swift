import SwiftUI


struct StudyViewTest: View {
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852

    // Пример массива категорий
    let categories: [PracticeCategory] = [
        .init(title: "Math", imageName: "function", progress: 0.7),
        .init(title: "Physics", imageName: "atom", progress: 0.4),
        .init(title: "Biology", imageName: "leaf", progress: 0.9),
        .init(title: "Chemistry", imageName: "flask", progress: 0.2)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {

                Color(.systemGroupedBackground).ignoresSafeArea()
                GeometryReader { geo in
                    let w = geo.size.width
                    let h = geo.size.height
                    let scaleW = w / baselineWidth
                    let scaleH = h / baselineHeight
                    let tileSize = (w - 48) / 2 // 2 плитки на ряд с отступами
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            
                            HStack {
                                Text("Practice by science")
                                    .font(.headline)
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            
                            // Сетка плиток
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ], spacing: 16) {
                                ForEach(categories) { category in
                                    NavigationLink {
                                        TestViewPractice(category: category)
                                    } label: {
                                        PracticeTileView(category: category, size: tileSize)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        .padding(.top, 8)
                    }
                }
            }
        }
    }
}

#Preview {
    StudyView()
}
