import SwiftUI

struct StudyView: View {
    
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    // Пример массива категорий заглушка
    let categories: [PracticeCategoryModel] = [
        .init(title: "General Science", imageName: "General Science", progressCircle: 0.25, progressCount: "1 of 159 questions completed"),
        .init(title: "Arithmetic reasoning", imageName: "Arithmetic reasoning", progressCircle: 0.25, progressCount: "1 of 159 questions completed"),
        .init(title: "Word knowledge", imageName:  "Word knowledge", progressCircle: 0.25, progressCount: "1 of 159 questions completed"),
        .init(title: "Paragraph\ncomprehension", imageName: "Paragraph comprehension", progressCircle: 0.25, progressCount: "1 of 159 questions completed"),
        .init(title: "Mathematics\nknowledge", imageName: "Mathematics knowledge", progressCircle: 0.25, progressCount: "1 of 159 questions completed"),
        .init(title: "Electronics\ninformation", imageName: "Electronics information", progressCircle: 0.25, progressCount: "1 of 159 questions completed"),
        .init(title: "Auto & shot\ninformation", imageName: "Auto & shot information", progressCircle: 0.25, progressCount: "1 of 159 questions completed"),
        .init(title: "Mechanical\nComprehension", imageName: "Mechanical Comprehension", progressCircle: 0.25, progressCount: "1 of 159 questions completed"),
        .init(title: "Assembling object", imageName: "Assembling object", progressCircle: 0.25, progressCount: "1 of 159 questions completed")
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
                            ZStack {
                                Circle()
                                .stroke(Color.circle, lineWidth: 6)
                                    .rotationEffect(.degrees(-90))
                                    .frame(width: 65 * scaleW, height: 65 * scaleH)
                                
                                Circle()
                                    .trim(from: 0)
                                    .stroke(Color.orange, lineWidth: 6)
                                    .frame(width: 65 * scaleW, height: 65 * scaleH)
                                Text("15%")
                                    .font(.system(size: 12.95, weight: .bold))
                            }
                            .padding(.leading, 16)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Practice progress")
                                    .font(.system(size: 16, weight: .bold))
                                Text("26 of 1142 questions completed")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.leading, 16)
                            Spacer()
                        }
                    }
                    .frame(width: 361 * scaleW, height: 77 * scaleH)
                    .background(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .padding(.top, 14)
                    // correct rate
                    VStack{
                        HStack{
                            ZStack {
                                Circle()
                                .stroke(Color.circle, lineWidth: 6)
                                    .rotationEffect(.degrees(-90))
                                    .frame(width: 65 * scaleW, height: 65 * scaleH)
                                Circle()
                                    .trim(from: 0)
                                    .stroke(Color.blue, lineWidth: 6)
                                    .frame(width: 65 * scaleW, height: 65 * scaleH)
                                Text("15%")
                                    .font(.system(size: 12.95, weight: .bold))
                            }
                            .padding(.leading, 16)
                            VStack(alignment: .leading, spacing: 4){
                                Text("Correct rate")
                                    .font(.system(size: 16, weight: .bold))
                                Text("16 of 1142 questions correct")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.leading, 16)
                            Spacer()
                        }
                    }
                    .frame(width: 361 * scaleW, height: 77 * scaleH)
                    .background(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    // Practice by science
                    HStack{
                        Text("Practice by science")
                            .font(.system(size: 16, weight: .semibold))
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    
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
                    .padding(.top, 16)
                }
            }
        }
    }
}
#Preview {
    StudyView()
}
