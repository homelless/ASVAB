import SwiftUI

struct WelcomeView189: View {
    
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    @State var selectionDate = Date()
    @State var selectionToggle = false
    
    @State var hour: Int = 8
    @State var minute: Int = 0
    @State var period: String = "AM"

    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            
            // Коэффициенты масштабирования относительно базового экрана
            let scaleW = w / baselineWidth
            let scaleH = h / baselineHeight
            
            let widthBombTimer = 390 * scaleW
            let heightBombTimer = 390 * scaleH
            
            let textTopPadding = 351 * scaleH 
           // let bombTimerTopPadding = 0 * scaleH
            
            let datePickerTopPadding = 420 * scaleH / 2
            let textDateExam = 580 * scaleH
            
            let previousTop = 753 * scaleH
            let buttonHeight = 62 * scaleH
            let buttonWidth = 350 * scaleW
            
            
            ZStack {
                Color("welcomeBackgroudColor").ignoresSafeArea()
                VStack{
                    Image("bombTimer")
                        .resizable()
                        .scaledToFill()
                        .frame(width: widthBombTimer, height: heightBombTimer)
                    //.padding(.top, bombTimerTopPadding)
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("What time do you prefer?")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .semibold))
                }
                .padding(.leading, 22)
                .padding(.top, textTopPadding)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                
                VStack(alignment: .center) {
                    TimeTripleWheelPicker(hour: $hour, minute: $minute, period: $period)
                }
                .frame(width: 284, height: 214)
                .padding(.top, datePickerTopPadding )
                
                
                HStack(spacing: 8) {
                    Text("Notify me")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    Toggle("", isOn: $selectionToggle)
                        .labelsHidden()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, textDateExam)
                
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
                }
            }
        }
    }
}

#Preview {
        WelcomeView189()
    }
