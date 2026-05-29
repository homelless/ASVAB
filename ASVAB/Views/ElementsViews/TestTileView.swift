import SwiftUI


struct TestTileView: View {
    
    let category: TestTileModel
    var width: CGFloat = 0
    var height: CGFloat = 0
    var radius: CGFloat = 0
    
    var body: some View {
        ZStack {
            Image(category.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
            Color.gradientTestTile
                ZStack{
                    // Фон кольца — всегда полный белый круг
                        Circle()
                        .stroke(Color.circle, lineWidth: 6)
                            .rotationEffect(.degrees(-90))
                            .frame(width: 55, height: 55)
                    Circle()
                        .trim(from: 0, to: category.progressCircle)
                        .stroke(
                                Color.blue,
                                style: StrokeStyle(lineWidth: 6,
                                                   lineCap: .round)
                            )
                        .rotationEffect(.degrees(-90))
                        .frame(width: 55, height: 55)
                    Text(category.progressCount + "%")
                        .font(.system(size: 12.95, weight: .bold))
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 40)
            VStack(spacing: 5){
                Text(category.text)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.top, 90)

                Text(category.progressTests + "/80 answered")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.white)
                        
                }
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
        
    }
}
    
#Preview {
    TestTileView(category: .init(text: "Test 1", imageName: "imageTest1", progressCircle: 0.25, progressCount: "15", progressTests: "5"), width: 142, height: 162, radius: 16)

}
