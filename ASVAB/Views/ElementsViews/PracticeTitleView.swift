import SwiftUI

struct PracticeTileView: View {
    let category: PracticeCategory
    let size: CGFloat

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                // Круговой индикатор прогресса (заглушка)
                Circle()
                    .trim(from: 0, to: category.progress)
                    .stroke(Color.blue, lineWidth: 6)
                    .rotationEffect(.degrees(-90))
                    .frame(width: size * 0.5, height: size * 0.5)
                Image(systemName: category.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size * 0.3, height: size * 0.3)
            }
            Text(category.title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.primary)
        }
        .frame(width: size, height: size)
        .background(Color.white)
        .cornerRadius(24)

    }
}
#Preview {
    PracticeTileView(category: .init(title: "Pop", imageName: "home", progress: 0.5), size: 150)
}
