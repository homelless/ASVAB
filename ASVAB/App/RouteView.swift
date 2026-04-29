import Foundation
import SwiftUI

struct RouteView: View {
    @State private var selectedTab: MainTab = .study
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.mainBackground
                GeometryReader { geo in
                    let w = geo.size.width
                    let h = geo.size.height
                    
                    // Коэффициенты масштабирования относительно базового экрана
                    let scaleW = w / baselineWidth
                    let scaleH = h / baselineHeight
                    
                    let widthTabBar = 393 * scaleW
                    let heightTabBar = 83 * scaleH
                    
                    VStack() {
                        // Контент для выбранной вкладки
                        switch selectedTab {
                        case .study: StudyView()
                        case .tests: TestsView()
                        case .stats: StatsView()
                        case .settings: SettingsView()
                        }
                        
                        
                        // Кастомный таб-бар
                        HStack {
                            ForEach(MainTab.allCases, id: \.self) { tab in
                                Button {
                                    selectedTab = tab
                                } label: {
                                    VStack {
                                        Image(selectedTab == tab ? tab.iconSelected: tab.icon )
                                            .font(.system(size: 22, weight: .bold))
                                            .foregroundColor(selectedTab == tab ? Color.button : .gray)
                                        Text(tab.title)
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundColor(selectedTab == tab ? Color.button : .gray)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.bottom, 10)
                                }
                                
                            }
                            
                        }
                        .frame(width: widthTabBar, height: heightTabBar)
                        .padding(.bottom, 21)
                        .background(.white)
                        .mask(RoundedRectangle(cornerRadius: 24 * scaleH, style: .continuous))
                        .shadow(color: Color.shadowTabBar, radius: 24 * scaleH, x: 0, y: -4)
                    }
                    .ignoresSafeArea(edges: .bottom)
                }
            }
        }
    }
}

#Preview {
    RouteView()
}

