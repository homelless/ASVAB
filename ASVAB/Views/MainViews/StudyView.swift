import SwiftUI

struct StudyView: View {
    
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    // Пример массива категорий
    let categories: [PracticeCategory] = [
        .init(title: "General Science", imageName: "function", progress: 0.7),
        .init(title: "Arithmetic reasoning", imageName: "atom", progress: 0.4),
        .init(title: "Word knowledge", imageName: "leaf", progress: 0.9),
        .init(title: "Paragraph comprehension", imageName: "flask", progress: 0.2),
        .init(title: "Mathematics knowledge", imageName: "flask", progress: 0.3),
        .init(title: "Electronics information", imageName: "flask", progress: 0.6),
        .init(title: "Auto & shot information", imageName: "flask", progress: 0.8),
        .init(title: "Mechanical Comprehension", imageName: "flask", progress: 0.8),
        .init(title: "Assembling object", imageName: "flask", progress: 0.8)
    ]
    
    
    var body: some View {
        ZStack {
            Color.mainBackground.ignoresSafeArea()
            GeometryReader { geo in
                let w = geo.size.width
                let h = geo.size.height
                let tileSize = (w - 48) / 2
                
                // Коэффициенты масштабирования относительно базового экрана
                let scaleW = w / baselineWidth
                let scaleH = h / baselineHeight
                
                ScrollView {
                    VStack{
                        //ASVAB TEST
                        HStack {
                            Text("ASVAB TEST")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal, 16)
                        
                        // days of your examination
                        HStack(alignment: .center){
                            Text("115 Days of your examination")
                                .font(.system(size: 12, weight: .bold))
                                //.padding(.top, 10 * scaleH)
                                .foregroundStyle(.white)
                                .frame(width: 216 * scaleW, height: 21 * scaleH)
                                .background(Color.daysExamination)
                                .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                            
                        }
                    }
                    
                    // practice progress
                    VStack{
                        HStack{
                            Spacer()
                            Circle()
                                .trim(from: 0)
                                .stroke(Color.orange, lineWidth: 6)
                                .frame(width: 50, height: 50)
                            Spacer()
                            VStack{
                                Text("cpractice progress")
                                Text("questions")
                            }
                            Spacer()
                        }
                    }
                    .frame(width: 361 * scaleW, height: 77 * scaleH)
                    .background(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16 * scaleH, style: .continuous)
                            .stroke(Color.black, lineWidth: 1 * max(scaleW, scaleH))
                    )
                    // correct rate
                    VStack{
                        HStack{
                            Spacer()
                            Circle()
                                .trim(from: 0)
                                .stroke(Color.blue, lineWidth: 6)
                                .frame(width: 50, height: 50)
                            Spacer()
                            VStack{
                                Text("correct rate")
                                Text("questions")
                            }
                            Spacer()
                        }
                    }
                    .frame(width: 361 * scaleW, height: 77 * scaleH)
                    .background(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16 * scaleH, style: .continuous)
                            .stroke(Color.black, lineWidth: 1 * max(scaleW, scaleH)))
                    // Practice by science
                    HStack{
                        Text("Practice by science")
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal, 16)
                    
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
                }
            }
        }
    }
}
#Preview {
    StudyView()
}
