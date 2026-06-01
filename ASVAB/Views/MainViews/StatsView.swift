

import SwiftUI

struct StatsView: View {
    
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
                        //Stats
                        HStack {
                            Text("Stats")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal, 16 * scaleW)
                        
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
                        
                        //Learning Progress
                        HStack{
                            Text("Learning Progress")
                                .font(.system(size: 16 * scaleH, weight: .semibold))
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal, 16 * scaleW)
                        .padding(.top, 16 * scaleH)
                        
                        // stats progress
                        VStack{
                            HStack(alignment: .center, spacing: 40){
                                VStack(spacing:5){
                                    Text("8")
                                        .font(.system(size: 24 * scaleH, weight: .bold))
                                        .foregroundStyle(.eight)
                                    Text("Questions answered")
                                        .font(.system(size: 12 * scaleH, weight: .regular))
                                        .multilineTextAlignment(.center)
                                }
                                .frame(width: 75 * scaleW, height: 64 * scaleH)
                                VStack(spacing:5){
                                    Text("10%")
                                        .font(.system(size: 24 * scaleH, weight: .bold))
                                        .foregroundStyle(.ten)
                                    Text("Questions unanswered")
                                        .font(.system(size: 12 * scaleH, weight: .regular))
                                        .multilineTextAlignment(.center)

                                }
                                .frame(width: 87 * scaleW, height: 63 * scaleH)
                                VStack(spacing:5){
                                    Text("100%")
                                        .font(.system(size: 24 * scaleH, weight: .bold))
                                        .foregroundStyle(.hundred)
                                    Text("Correct answers")
                                        .font(.system(size: 12 * scaleH, weight: .regular))
                                        .multilineTextAlignment(.center)


                                }
                                .frame(width: 66 * scaleW, height: 63 * scaleH)
                            }
                            
                        }
                        .frame(width: 361 * scaleW, height: 105 * scaleH)
                        .background(Color.white)
                        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .padding(.top, 14 * scaleH)
                        
                        HStack{
                            Text("Subject Statistics")
                                .font(.system(size: 16 * scaleH, weight: .semibold))
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal, 16 * scaleW)
                        .padding(.top, 16 * scaleH)
                    }
                }
            }
        }
    }
}

#Preview {
    StatsView()
}
