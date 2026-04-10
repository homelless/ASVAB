import SwiftUI

struct TimeTripleWheelPicker: View {
    @Binding var hour: Int
    @Binding var minute: Int
    @Binding var period: String
    
    private let hours = Array(1...12)
    private let minutes = Array(0...59)
    private let periods = ["AM", "PM"]

    // Количество повторений диапазона в колесе
    private let repeatCount = 3
    
    // Сгенерированные массивы для "бесконечного" колеса
    private var repeatedHours: [Int] { Array(repeating: hours, count: repeatCount).flatMap { $0 } }
    private var repeatedMinutes: [Int] { Array(repeating: minutes, count: repeatCount).flatMap { $0 } }
    
    // Центральный (основной) цикл
    private var middleHourIndex: Int { (repeatedHours.count / 2) - (repeatedHours.count / 2) % hours.count + hours.firstIndex(of: hour)! }
    private var middleMinuteIndex: Int { (repeatedMinutes.count / 2) - (repeatedMinutes.count / 2) % minutes.count + minutes.firstIndex(of: minute)! }
    
    // Внутренние индексы состояния колес
    @State private var selectedHourIndex: Int = 0
    @State private var selectedMinuteIndex: Int = 0

    var body: some View {
        ZStack {
            HStack(spacing: 1) {
                Picker("Hour", selection: $selectedHourIndex) {
                    ForEach(repeatedHours.indices, id: \.self) { idx in
                        Text("\(repeatedHours[idx])")
                            .tag(idx)
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(.wheel)
                .frame(maxWidth: .infinity)
                .onChange(of: selectedHourIndex) { _, newValue in
                    // Обновляем hour по индексу
                    hour = repeatedHours[newValue]
                    let center = middleHourIndex
                    if newValue < hours.count || newValue >= repeatedHours.count - hours.count {
                        let targetIdx = center - center % hours.count + (newValue % hours.count)
                        selectedHourIndex = targetIdx
                    }
                }
                
                // МИНУТЫ
                Picker("Minute", selection: $selectedMinuteIndex) {
                    ForEach(repeatedMinutes.indices, id: \.self) { idx in
                        Text(String(format: "%02d", repeatedMinutes[idx]))
                            .tag(idx)
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(.wheel)
                .frame(maxWidth: .infinity)
                .onChange(of: selectedMinuteIndex) { _, newValue in
                    minute = repeatedMinutes[newValue]
                    let center = middleMinuteIndex
                    if newValue < minutes.count || newValue >= repeatedMinutes.count - minutes.count {
                        let targetIdx = center - center % minutes.count + (newValue % minutes.count)
                        selectedMinuteIndex = targetIdx
                    }
                }

                Picker("AM/PM", selection: $period) {
                    ForEach(periods, id: \.self) { p in
                        Text(p)
                            .tag(p)
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(.wheel)
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            // При появлении, выставить индексы к центральному кругу с нужными hour/minute
            if let hIdx = hours.firstIndex(of: hour) {
                selectedHourIndex = (repeatedHours.count / 2) - (repeatedHours.count / 2) % hours.count + hIdx
            }
            if let mIdx = minutes.firstIndex(of: minute) {
                selectedMinuteIndex = (repeatedMinutes.count / 2) - (repeatedMinutes.count / 2) % minutes.count + mIdx
            }
        }
        .onChange(of: hour) { _, newValue in
            // Если hour изменён снаружи — прыгаем к центру
            if let hIdx = hours.firstIndex(of: newValue) {
                selectedHourIndex = (repeatedHours.count / 2) - (repeatedHours.count / 2) % hours.count + hIdx
            }
        }
        .onChange(of: minute) { _, newValue in
            if let mIdx = minutes.firstIndex(of: newValue) {
                selectedMinuteIndex = (repeatedMinutes.count / 2) - (repeatedMinutes.count / 2) % minutes.count + mIdx
            }
        }
    }
}

#Preview {
    TimeTripleWheelPicker(
        hour: .constant(9),
        minute: .constant(30),
        period: .constant("AM")
    )
}
