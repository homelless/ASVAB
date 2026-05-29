import SwiftUI

/// Плитка категории практики на экране Study.
/// Отображается в сетке 2×N; по нажатию открывает `TestViewPractice` (см. `StudyView`).
struct PracticeTileView: View {
    /// Данные категории: название, иконка, доля прогресса и текст счётчика вопросов.
    let category: PracticeCategoryModel
    
    var body: some View {
        ZStack {
            // Фон под плиткой совпадает с экраном Study, чтобы не было «щели» по краям.
            Color.mainBackground.ignoresSafeArea()
            VStack() {
                VStack {
                    // Верхняя строка: кольцо прогресса и иконка раздела.
                    HStack(spacing: 25) {
                        // Кольцевой индикатор: `progressCircle` — доля от 0 до 1 (например, 0.25 = 25%).
                        // Поворот на −90° — старт дуги сверху, как у типичного progress ring.
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
                                        style: StrokeStyle(lineWidth: 6, lineCap: .round)
                                    )
                                .rotationEffect(.degrees(-90))
                                .frame(width: 55, height: 55)
                            Text("15%")
                                .font(.system(size: 12.95, weight: .bold))
                        }
                        // Иллюстрация категории из Assets (`imageName` из модели).
                        Image(category.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 54, height: 54)
                    }
                    .frame(width: 148, height: 59)
                    .padding(.bottom, 10)
                    
                    // Название раздела и подпись прогресса («N of M questions completed»).
                    VStack(alignment: .leading, spacing: 4) {
                        Text(category.title)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.leading)
                            // Позволяет переносить длинные заголовки на несколько строк.
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
            // Фиксированный размер карточки для единообразной сетки в `LazyVGrid`.
            .frame(width: 172, height: 175)
            .background(Color.white)
            .cornerRadius(24)
            
        }
    }
    
}

#Preview {
    PracticeTileView(category: .init(title: "General Science", imageName: "General Science", progressCircle: 0.25, progressCount: "1 of 159 questions\ncompleted"))
}
