import SwiftUI

struct TestsView: View {
    
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    let categories: [TestTileModel] = [
        .init(text: "Test1" , imageName: "imageTest1", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test2" , imageName: "imageTest2", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test3" , imageName: "imageTest3", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test4" , imageName: "imageTest4", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test5" , imageName: "imageTest5", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test6" , imageName: "imageTest6", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test7" , imageName: "imageTest7", progressCircle: 0.25, progressCount: "14", progressTests: "0"),
        .init(text: "Test8" , imageName: "imageTest8", progressCircle: 0.25, progressCount: "14", progressTests: "0")
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
                    // Все секции в одном VStack — иначе блоки накладываются в одной точке и сетка перекрывает экран.
                    VStack(spacing: 0) {
                        // Tests
                        VStack{
                            HStack {
                                Text("Tests")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(.black)
                                Spacer(minLength: 0)
                            }
                            .padding(.horizontal, 16)
                            
                            // days of your examination
                            HStack(alignment: .center){
                                Text("115 Days of your examination")
                                    .font(.system(size: 12, weight: .bold))
                                
                                    .foregroundStyle(.white)
                                    .frame(width: 216 * scaleW, height: 21 * scaleH)
                                    .background(Color.daysExamination)
                                    .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                
                            }
                        }
                        
                        // three Game mode
                        VStack(spacing: 12 * scaleH){
                            HStack{
                                HStack(spacing:36){
                                    Image("ten")
                                        .padding(.leading, 20)
                                    Text("Quick 10 Quiz")
                                        .font(.system(size: 16, weight: .bold))
                                }
                                Spacer()
                                Image("arrow")
                                    .padding(.trailing, 8)
                            }
                            .frame(width: 361 * scaleW, height: 77 * scaleH)
                            .background(Color.white)
                            .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            
                            HStack{
                                HStack(spacing:36){
                                    Image("timeTest")
                                        .padding(.leading, 20)
                                    Text("Timed Test")
                                        .font(.system(size: 16, weight: .bold))
                                    
                                }
                                Spacer()
                                Image("arrow")
                                    .padding(.trailing, 8)
                                
                            }
                            .frame(width: 361 * scaleW, height: 77 * scaleH)
                            .background(Color.white)
                            .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            
                            HStack{
                                HStack(spacing:30){
                                    Image("cube")
                                        .padding(.leading, 20)
                                    Text("Random Questions")
                                        .font(.system(size: 16, weight: .bold))
                                }
                                Spacer()
                                Image("arrow")
                                    .padding(.trailing, 8)
                            }
                            .frame(width: 361 * scaleW, height: 77 * scaleH)
                            .background(Color.white)
                            .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            
                        }
                        .frame(width: 361 * scaleW, height: 247 * scaleH)
                        .padding(.top, 24)
                        
                        // Practice tests
                        HStack{
                            Text("Practice tests")
                                .font(.system(size: 16, weight: .semibold))
                            Spacer()
                            Button(action: {
                                
                            }, label: {
                                Text("See all")
                                    .font(.system(size: 14, weight: .semibold))
                                    .underline()
                                    .foregroundStyle(.button)
                            })
                        }
                        .frame(width: 361 * scaleW, height: 13 * scaleH)
                        .padding(.top, 34)
                        
                        VStack {
                            // TestTiles — горизонтальный скролл, фиксированная высота ряда.
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: [
                                    GridItem(.fixed(162 * scaleH)),
                                ], spacing: 8) {
                                    ForEach(categories) { category in
                                        NavigationLink {
                                            ExaminationTestsView(category: category)
                                        } label: {
                                            TestTileView(category: category, width: 142 * scaleW, height: 162 * scaleH, radius: 16)
                                        }
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                            .frame(height: 162 * scaleH)
                            .padding(.top, 34 * scaleH)
                        }
                        VStack {
                            ZStack{
                                Image("imageFinalTest")
                                    .resizable()
                                    .scaledToFill()
                                    .offset(y: 10)
                                    .frame(width: 363 * scaleW, height: 162 * scaleH)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                Color.gradientTestTile
                                    .frame(width: 363 * scaleW, height: 162 * scaleH)
                                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            }
                        }
                        .padding(.top, 34 * scaleH)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    TestsView()
}
