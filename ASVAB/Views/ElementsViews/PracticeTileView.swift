import SwiftUI

struct PracticeTileView: View {
    let category: PracticeCategory
    
    var body: some View {
        ZStack {
            Color.mainBackground.ignoresSafeArea()
            VStack() {
                VStack{
                    HStack(spacing: 25){
                        // Круговой индикатор прогресса (заглушка)
                        Circle()
                            .trim(from: 0, to: category.progressCircle)
                            .stroke(Color.blue, lineWidth: 6)
                            .rotationEffect(.degrees(-90))
                            .frame(width: 59 , height: 59)
                        
                        Image(category.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 54, height: 54)
                    }
                    .frame(width: 148, height: 59)
                    .padding(.bottom, 10)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(category.title)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(category.progressCount)
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.secondary)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                }
                
            }
            .frame(width: 172 , height: 175)
            .background(Color.white)
            .cornerRadius(24)
            
        }
    }
    
}

#Preview {
    PracticeTileView(category: .init(title: "General Science", imageName: "General Science", progressCircle: 1, progressCount: "1 of 159 questions\ncompleted"))
}

