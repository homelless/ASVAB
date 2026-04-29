import SwiftUI

struct WelcomeView186: View {
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852

    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height

            // Коэффициенты масштабирования относительно базового экрана
            let scaleW = w / baselineWidth
            let scaleH = h / baselineHeight
            
            let imageOffsetX = -355 * scaleW
            
            let maskStartLocation: CGFloat = 0.4
            let maskEndLocation: CGFloat = 0.8
            
            let textTopPadding = 580 * scaleH
            let previousTop = 753 * scaleH
            let buttonHeight = 62 * scaleH
            let buttonWidth = 350 * scaleW

            ZStack {
                Color("welcomeBackgroudColor").ignoresSafeArea()
                VStack(spacing: 0) {
                    Image("welcome186")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 906, height: 604, alignment: .top)
                        .offset(x: imageOffsetX)
                        .mask(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: .white, location: maskStartLocation),
                                    .init(color: .clear, location: maskEndLocation)
                                ]),
                                startPoint: .center,
                                endPoint: .bottom
                            )
                        )
                        .clipped()
                    Spacer(minLength: 0)
                }
                .ignoresSafeArea(edges: .top)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Practice with Quizzes and\ntests")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .semibold))
                    Text("Learn anytime, anywhere with a variety of\nstudy modes")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .regular))
                }
                .padding(.leading, 22)
                .padding(.top, textTopPadding)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

            }
            VStack(alignment:.center) {
                Button(action: {}) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: buttonWidth, height: buttonHeight)
                        .background(
                            RoundedRectangle(cornerRadius: 20 * scaleH, style: .continuous)
                                .fill(Color.button)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20 * scaleH, style: .continuous)
                                .stroke(Color.black, lineWidth: 1 * max(scaleW, scaleH))
                        )
                        .contentShape(RoundedRectangle(cornerRadius: 20 * scaleH, style: .continuous))
                }
                .padding(.top, previousTop)
                .padding(.leading, 22)
            }
        }
    }
}

#Preview {
    WelcomeView186()
}
