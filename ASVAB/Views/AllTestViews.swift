
import SwiftUI

struct AllTestViews: View {
    
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    let categories: [TestTileModel] = [
        .init(text: "Test 1" , imageName: "imageTest1", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test 2" , imageName: "imageTest2", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test 3" , imageName: "imageTest3", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test 4" , imageName: "imageTest4", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test 5" , imageName: "imageTest5", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test 6" , imageName: "imageTest6", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test 7" , imageName: "imageTest7", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test 8" , imageName: "imageTest8", progressCircle: 0.25, progressCount: "14", progressTests: "0")
    ]
    
    var body: some View {
        ZStack {
            Color.mainBackground.ignoresSafeArea()
            GeometryReader { geo in
                let w = geo.size.width
                let h = geo.size.height
                
                
                // Коэффициенты масштабирования относительно базового экрана
                let scaleW = w / baselineWidth
                let scaleH = h / baselineHeight
                
                ScrollView {
                    
                    VStack{
                        LazyVGrid(columns:[
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 8) {
                            ForEach(categories) { category in
                                NavigationLink {
                                    ExaminationTestsView(category: category)
                                } label: {
                                    TestTileView(category: category, width: 160 * scaleW, height: 196 * scaleH, radius: 16)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                }
            }
        }
        .navigationTitle("Practice tests")
        .navigationBarTitleDisplayMode(.inline)
    }

}

#Preview {
    AllTestViews()
}
