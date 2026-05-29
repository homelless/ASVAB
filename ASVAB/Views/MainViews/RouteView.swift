import Foundation
import SwiftUI

struct RouteView: View {
    @State private var selectedTab: MainTab = .study
    private let baselineWidth: CGFloat = 393
    private let baselineHeight: CGFloat = 852
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mainBackground
                    .ignoresSafeArea()
                
                GeometryReader { geo in
                    let w = geo.size.width
                    let h = geo.size.height
                    let scaleW = w / baselineWidth
                    let scaleH = h / baselineHeight
                    let heightTabBar = 83 * scaleH
                    let tabBarBottomPadding = 21 * scaleH
                    
                    ZStack(alignment: .bottom) {
                        Group {
                            switch selectedTab {
                            case .study: StudyView()
                            case .tests: TestsView()
                            case .stats: StatsView()
                            case .settings: SettingsView()
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        // Отступ контента, чтобы скролл не уходил под таб-бар.
                        .padding(.bottom, heightTabBar + tabBarBottomPadding)
                        
                        customTabBar(scaleW: scaleW, scaleH: scaleH)
                    }
                    .ignoresSafeArea(edges: .bottom)

                }
            }
        }
    }
    
    @ViewBuilder
    private func customTabBar(scaleW: CGFloat, scaleH: CGFloat) -> some View {
        let widthTabBar = 393 * scaleW
        let heightTabBar = 83 * scaleH
        let cornerRadius = 24 * scaleH
        
        HStack {
            ForEach(MainTab.allCases, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack {
                        Image(selectedTab == tab ? tab.iconSelected : tab.icon)
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
        .padding(.bottom, 21 * scaleH)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: cornerRadius,
                topTrailingRadius: cornerRadius,
                style: .continuous
            )
        )
        .shadow(color: Color.shadowTabBar, radius: 12 * scaleH, x: 0, y: 2)
    }
    
}

#Preview {
    RouteView()
}
