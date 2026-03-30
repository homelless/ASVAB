import SwiftUI

struct WelcomeView190: View {
    var body: some View {
        ZStack {
            Color("welcomeBackgroudColor").ignoresSafeArea()
            VStack {
                Image("Frame")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 348, maxHeight: 153)
                
                Text("ASVAB test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    WelcomeView190()
}
