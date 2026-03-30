import SwiftUI

struct DateTripleWheelPicker: View {
    @Binding var date: Date

    // Диапазон лет для выбора
    var yearsRange: ClosedRange<Int> = 1900...2100

    // Цвета/шрифты
    var textColor: Color = .white
    var selectedTextColor: Color = .white
    var unselectedOpacity: Double = 0.7
    var font: Font = .system(size: 24, weight: .regular)
    var selectedFont: Font = .system(size: 24, weight: .regular)

    // Локаль для названий месяцев
    var locale: Locale = Locale(identifier: "en_US") // даёт порядок M-D-Y в нашем UI

    @State private var selectedMonth: Int = 1
    @State private var selectedDay: Int = 1
    @State private var selectedYear: Int = 2000

    private let calendar = Calendar(identifier: .gregorian)

    var body: some View {
        HStack(spacing: 12) {
            // Month
            WheelColumn(
                items: months(),
                selection: Binding(
                    get: { selectedMonth - 1 },
                    set: { newIndex in
                        selectedMonth = newIndex + 1
                        clampDayIfNeeded()
                        updateDateFromSelections()
                    }
                ),
                labelForIndex: { index in
                    months()[index]
                },
                textColor: textColor,
                selectedTextColor: selectedTextColor,
                unselectedOpacity: unselectedOpacity,
                font: font,
                selectedFont: selectedFont
            )
            .frame(maxWidth: .infinity)

            // Day
            WheelColumn(
                items: daysInSelectedMonth().map { String($0) },
                selection: Binding(
                    get: { min(max(selectedDay - 1, 0), daysInSelectedMonth().count - 1) },
                    set: { newIndex in
                        selectedDay = min(newIndex + 1, daysInSelectedMonth().count)
                        updateDateFromSelections()
                    }
                ),
                labelForIndex: { index in
                    daysInSelectedMonth()[index].description
                },
                textColor: textColor,
                selectedTextColor: selectedTextColor,
                unselectedOpacity: unselectedOpacity,
                font: font,
                selectedFont: selectedFont
            )
            .frame(maxWidth: .infinity)

            // Year
            WheelColumn(
                items: years().map { String($0) },
                selection: Binding(
                    get: { selectedYear - yearsRange.lowerBound },
                    set: { newIndex in
                        selectedYear = yearsRange.lowerBound + newIndex
                        clampDayIfNeeded()
                        updateDateFromSelections()
                    }
                ),
                labelForIndex: { index in
                    years()[index].description
                },
                textColor: textColor,
                selectedTextColor: selectedTextColor,
                unselectedOpacity: unselectedOpacity,
                font: font,
                selectedFont: selectedFont
            )
            .frame(maxWidth: .infinity)
        }
        .onAppear {
            // Инициализируемся от исходной даты
            let comps = calendar.dateComponents([.year, .month, .day], from: date)
            selectedYear = comps.year ?? 2000
            selectedMonth = comps.month ?? 1
            selectedDay = comps.day ?? 1
            clampDayIfNeeded()
        }
        .onChange(of: date) { _, newDate in
            // Если внешне изменили date - подтянем колёса
            let comps = calendar.dateComponents([.year, .month, .day], from: newDate)
            selectedYear = comps.year ?? selectedYear
            selectedMonth = comps.month ?? selectedMonth
            selectedDay = comps.day ?? selectedDay
            clampDayIfNeeded()
        }
    }

    // MARK: - Helpers

    private func months() -> [String] {
        // Локализованные короткие названия месяцев (Jan, Feb, ...), можно поменять на standaloneMonthSymbols
        let formatter = DateFormatter()
        formatter.locale = locale
        // стиль: monthSymbols (полные), shortMonthSymbols (короткие)
        return formatter.standaloneMonthSymbols
    }

    private func years() -> [Int] {
        Array(yearsRange)
    }

    private func daysInSelectedMonth() -> [Int] {
        var comps = DateComponents()
        comps.year = selectedYear
        comps.month = selectedMonth
        comps.day = 1
        guard let firstDay = calendar.date(from: comps),
              let range = calendar.range(of: .day, in: .month, for: firstDay) else {
            return Array(1...30)
        }
        return Array(range)
    }

    private func clampDayIfNeeded() {
        let maxDay = daysInSelectedMonth().last ?? 30
        if selectedDay > maxDay {
            selectedDay = maxDay
        }
    }

    private func updateDateFromSelections() {
        var comps = DateComponents()
        comps.year = selectedYear
        comps.month = selectedMonth
        comps.day = selectedDay
        if let newDate = calendar.date(from: comps) {
            date = newDate
        }
    }
}

// Универсальная колонка-колесо с полным контролем цветов
private struct WheelColumn: View {
    let items: [String]
    @Binding var selection: Int

    let labelForIndex: (Int) -> String

    var textColor: Color
    var selectedTextColor: Color
    var unselectedOpacity: Double
    var font: Font
    var selectedFont: Font

    var body: some View {
        GeometryReader { geo in
            Picker("", selection: $selection) {
                ForEach(items.indices, id: \.self) { idx in
                    let isSelected = idx == selection
                    Text(labelForIndex(idx))
                        .font(isSelected ? selectedFont : font)
                        .foregroundColor(isSelected ? selectedTextColor : textColor.opacity(unselectedOpacity))
                        .lineLimit(1)
                        .minimumScaleFactor(0.75) 
                        .frame(maxWidth: .infinity, alignment: .center)
                        .tag(idx)
                }
            }
            .pickerStyle(.wheel)
            // tint влияет на маркер/выделение
            .tint(selectedTextColor)
            // клип, чтобы текст не обрезался
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
        .frame(minHeight: 160)
    }
}
