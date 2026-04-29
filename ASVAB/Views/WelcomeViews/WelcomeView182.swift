
import SwiftUI

struct WelcomeView182: View {
    
    private enum Plan {
        case weekly
        case yearly
    }
    
    @State private var selectedPlan: Plan = .yearly
    
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    let maskStartLocation: CGFloat = 0.5
    let maskEndLocation: CGFloat = 0.7
    
        var body: some View {
            GeometryReader { geo in
                let w = geo.size.width
                let h = geo.size.height
                
                // Коэффициенты масштабирования относительно базового экрана
                let scaleW = w / baselineWidth
                let scaleH = h / baselineHeight
                
                // адаптивные размеры для интерфейса
                let widthImage = 394 * scaleW
                let heightImage = 702 * scaleH
                let offsetImage : CGFloat = 100 * scaleW
                let topPaddingText: CGFloat = 290 * scaleH
                
                let previousTop = 753 * scaleH
                let buttonHeight = 62 * scaleH
                let buttonWidth = 350 * scaleW
                
                let buttonPayHeight = 69 * scaleH
                let buttonPayWidth = 345 * scaleW
                let buttonPayPaddingWeekly = 155 * scaleW
                let buttonPayPaddingYearly = 95 * scaleW
                let buttonPayTopPadding = 280 * scaleH
                
                let canselTextTopPadding = 630 * scaleH
                
                ZStack {
                    Color("welcomeBackgroudColor").ignoresSafeArea()
                    
                    //imageWar
                    VStack(spacing: 0) {
                        Image("welcome182")
                            .resizable()
                            .scaledToFill()
                            .frame(width: widthImage, height: heightImage, alignment: .top)
                            .offset(y: -offsetImage)
                            .mask(
                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        .init(color: .white, location: maskStartLocation),
                                        .init(color: .clear, location: maskEndLocation)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .clipped()
                        Spacer(minLength: 0)
                    }
                    .ignoresSafeArea(edges: .top)
                    
                    //text upgrade
                    VStack{
                        Text("Upgrade to")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.upgrade)
                        Text("ASVAB PRO")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.asvabPro)
                        Spacer()
                    }
                    .padding(.top, topPaddingText)
                    
                    VStack(alignment: .center) {
                        // star text
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Image("star")
                                    .padding(.top, 5)
                                Text("1000+ questions ready")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.white)
                            }
                            HStack(alignment: .top) {
                                Image("star")
                                    .padding(.top, 5)
                                Text("Unlock all efficient practice modes")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.white)
                            }
                            HStack(alignment: .top) {
                                Image("star")
                                    .padding(.top, 5)
                                Text("Help you get better scores with\ngreater certainty")
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.white)
                                    .lineLimit(2)
                            }
                        }
                        .padding(.trailing, 10)
                        //payButtons
                        VStack(spacing: 16) {
                        //weekly
                        Button(action: {selectedPlan = .weekly}) {
                            HStack(spacing: buttonPayPaddingWeekly){
                                let weekly = (selectedPlan == .weekly)
                                Text("Weekly")
                                    .foregroundStyle(weekly ? Color.white : .gray)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("$ 9.99/week")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(weekly ? Color.white : .gray)
                            }
                        }
                        .frame(width: buttonPayWidth, height: buttonPayHeight)
                        .background(
                            RoundedRectangle(cornerRadius: 20 * scaleH, style: .continuous)
                                .fill(Color.clear)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20 * scaleH, style: .continuous)
                                .stroke(selectedPlan == .weekly ? Color.button : .gray, lineWidth: 1 )
                        )
                        .contentShape(RoundedRectangle(cornerRadius: 20 * scaleH, style: .continuous))
                    
                            //yearly
                            Button(action: {selectedPlan = .yearly}) {
                                HStack(spacing: buttonPayPaddingYearly){
                                    let yearly = (selectedPlan == .yearly)
                                    VStack(alignment: .leading){
                                        Text("Yearly")
                                            .foregroundStyle(yearly ? Color.white : .gray)
                                            .font(.system(size: 16, weight: .medium))
                                        Text("$59.99 billed yearly")
                                            .foregroundStyle(yearly ? Color.white : .gray)
                                            .font(.system(size: 12, weight: .medium))
                                            .lineLimit(1)
                                    }
                                    Text("$ 4.99/week")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundStyle(yearly ? Color.white : .gray)
                                }
                            }
                            .frame(width: buttonPayWidth, height: buttonPayHeight)
                            .background(
                                RoundedRectangle(cornerRadius: 20 * scaleH, style: .continuous)
                                    .fill(Color.clear)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 20 * scaleH, style: .continuous)
                                    .stroke(selectedPlan == .yearly ? Color.button : .gray, lineWidth: 1 )
                            )
                            .contentShape(RoundedRectangle(cornerRadius: 20 * scaleH, style: .continuous))
                            
                        }
                        .padding(.top, 20)
                    }
                    .padding(.top, buttonPayTopPadding)
                    
                    //cansel
                    VStack(alignment: .center){
                        HStack {
                            Image("time")
                            Text("CANSEL ANYTIME")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, canselTextTopPadding)
                    
                    // button continue
                    VStack(alignment:.center) {
                        Button(action: {}) {
                            Text("Try for Free")
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
    WelcomeView182()
}
