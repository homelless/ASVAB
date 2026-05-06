import SwiftUI

struct StudyView: View {
    
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    // Пример массива категорий
    let categories: [PracticeCategory] = [
        .init(title: "General Science", imageName: "General Science", progressCircle: 1, progressCount: "1 of 159 questions completed"),
        .init(title: "Arithmetic reasoning", imageName: "Arithmetic reasoning", progressCircle: 1, progressCount: "1 of 159 questions completed"),
        .init(title: "Word knowledge", imageName:  "Word knowledge", progressCircle: 1, progressCount: "1 of 159 questions completed"),
        .init(title: "Paragraph\ncomprehension", imageName: "Paragraph comprehension", progressCircle: 1, progressCount: "1 of 159 questions completed"),
        .init(title: "Mathematics\nknowledge", imageName: "Mathematics knowledge", progressCircle: 1, progressCount: "1 of 159 questions completed"),
        .init(title: "Electronics\ninformation", imageName: "Electronics information", progressCircle: 1, progressCount: "1 of 159 questions completed"),
        .init(title: "Auto & shot\ninformation", imageName: "Auto & shot information", progressCircle: 1, progressCount: "1 of 159 questions completed"),
        .init(title: "Mechanical\nComprehension", imageName: "Mechanical Comprehension", progressCircle: 1, progressCount: "1 of 159 questions completed"),
        .init(title: "Assembling object", imageName: "Assembling object", progressCircle: 1, progressCount: "1 of 159 questions completed")
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
                    // test tiles
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        ForEach(categories) { category in
                            NavigationLink {
                                TestViewPractice(category: category)
                            } label: {
                                PracticeTileView(category: category)
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
