import SwiftUI

struct WelcomeView187: View {
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    @State var selectionDate = Date()
    @State var checkmark = false
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            
            // Коэффициенты масштабирования относительно базового экрана
            let scaleW = w / baselineWidth
            let scaleH = h / baselineHeight
            
            let widthCalendar = 246.43 * scaleW
            let heightCalendar = 238.32 * scaleH
            
            let textTopPadding = 351 * scaleH 
            let calendarTopPadding = 88.48 * scaleH / 2
            
            let datePickerTopPadding = 420 * scaleH / 2
            let textDateExam = 580 * scaleH
            
            let previousTop = 753 * scaleH
            let buttonHeight = 62 * scaleH
            let buttonWidth = 350 * scaleW
            
            
            ZStack {
                Color("welcomeBackgroudColor").ignoresSafeArea()
                VStack{
                    Image("calendar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: widthCalendar, height: heightCalendar)
                        .padding(.top, calendarTopPadding)
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("When is your Exam?")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .semibold))
                }
                .padding(.leading, 22)
                .padding(.top, textTopPadding)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                
                VStack(alignment: .center) {
                    DateTripleWheelPicker(
                        date: $selectionDate,
                        yearsRange: 1950...2050,
                        textColor: .white,
                        selectedTextColor: .white,
                        unselectedOpacity: 0.6,
                        font: .system(size: 20, weight: .regular),
                        selectedFont: .system(size: 20, weight: .semibold),
                        locale: Locale(identifier: "en_US") // порядок M-D-Y
                    )
                    .frame(height: 280)
                    .padding(.horizontal, 22)
                    .padding(.top, datePickerTopPadding)
                }
                HStack(spacing: 71){
                    Text("I don’t know my exam date eyt")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.top, textDateExam)
                        
                    Button(action: {
                        checkmark.toggle()
                    }) {
                        ZStack {
                            Circle()
                                .stroke(Color.white.opacity(0.7), lineWidth: 1)
                                .background(
                                    Circle()
                                        .fill(checkmark ? Color.button : Color.clear)
                                )
                                .frame(width: 22, height: 22)
                            
                            if checkmark {
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.top, textDateExam)
                    .buttonStyle(PlainButtonStyle())
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
}

#Preview {
        WelcomeView187()
    }
    
    
  
    
    
