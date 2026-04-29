import SwiftUI

struct WelcomeView190: View {
    
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    let maskStartLocation: CGFloat = 0.5
    let maskEndLocation: CGFloat = 0.6
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            
            // Коэффициенты масштабирования относительно базового экрана
            let scaleW = w / baselineWidth
            let scaleH = h / baselineHeight
            
            let widthImage = 348 * scaleW
            let heightImage = 153 * scaleH
            
            
            
            ZStack {
                Color("welcomeBackgroudColor").ignoresSafeArea()
                VStack {
                    Image("Frame")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: widthImage, maxHeight: heightImage)
                    
                    Text("ASVAB test")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
#Preview {
    WelcomeView190()
}
