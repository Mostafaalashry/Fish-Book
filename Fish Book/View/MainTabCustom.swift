//
//  MainTabCustom.swift
//  Fish Book
//
//  Created by mostafa on 03/05/2024.
//

import SwiftUI


import SwiftUI

struct MainTabCustom: View {
    /// View Properties
    @State private var activeTab:Tab = .home
    /// For Smooth Shape Sliding Effect, We're going to use Matched Gematry Effect
    @Namespace private var animation
    @State private var tabShapePostion: CGPoint = .zero
    init() {
        /// Hiding Tab bar due To SwiftUI iOS 16 Bug
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack( spacing: 0) {
            TabView(selection: $activeTab) {
                Color.orange
                    .overlay(content: {
                        Text("DevTechie.com")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })
                    .tag(Tab.home)
                    .edgesIgnoringSafeArea(.bottom)
                WeatherView()
                    .tag(Tab.weather)
                    .edgesIgnoringSafeArea(.bottom)
                
                ShopView()
                    .tag(Tab.shop)
                    .edgesIgnoringSafeArea(.bottom)
                
                ProfileView()
                    .tag(Tab.profile)
                    .edgesIgnoringSafeArea(.bottom)
                
                Color.pink
                    .overlay(content: {
                        Text(".com")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })
                    .tag(Tab.fishes)
                    .edgesIgnoringSafeArea(.bottom)
            }
            CustomTabbar()
             
        }
    }
    
    
    /// Custom Tab Bar
    /// With More Easy Customization
    @ViewBuilder
    func CustomTabbar(_ tint: Color = Color("Primary Blue"), _ inactiveTint: Color = Color("Primary Blue")) -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabIItem(tint: tint,
                        inactiveTint: inactiveTint,
                        tab: $0,
                        animation: animation,
                        activeTab: $activeTab,
                        position: $tabShapePostion
                )
            }
        }
        .padding(.horizontal, 15)
      //  .padding(.vertical, 10)
        .background(content: {
            TabShape(midpoint: tabShapePostion.x)
                .fill(.white)
                .ignoresSafeArea()
                /// Adding Blur + Shadow
                /// For Shape Smoothing
                .shadow(color: Color("Primary Blue").opacity(0.5), radius: 1, x: 0, y: -5)
                .blur(radius: 2)
             //   .padding(.top, 25)
        })
        /// Adding Animation
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}
/*
 struct MainTabCustom_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }
 
 */

///Tab Bar Item
struct TabIItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab:Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    
    /// Each Tab Item Postion on the Screen
    @State private var tabPostion:CGPoint = .zero
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
                /// Increasing Size For Active Tab
                .frame(width: activeTab == tab ? 58 : 35,height: activeTab == tab ? 58 : 35)
                .background{
                    if activeTab == tab {
                        Circle()
                            .fill(Color("Primary Blue"))
                           // .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? .blue : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPostion(completion: { rect in
            tabPostion.x = rect.midX
            
            /// Updating Active Tab Postion
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabPostion.x
            }
        }
        
    }
}




struct TabShape: Shape {
    var midpoint: CGFloat
    
    /// Adding Shape Animation
    var animatableData: CGFloat {
        get { midpoint }
        set {
            midpoint = newValue
        }
    }
    func path(in rect: CGRect) -> Path {
        return Path { path in
            /// First Drawing the Rectangle Shape
            path.addPath(Rectangle().path(in: rect))
            /// Now Drawing Upward Curve Shape
            path.move(to: .init(x: midpoint - 60, y: 0))
            
            let to = CGPoint(x: midpoint, y: -25)
            let control1 = CGPoint(x: midpoint - 25, y: 0)
            let control2 = CGPoint(x: midpoint - 25, y: -25)
            
            path.addCurve(to: to, control1: control1, control2: control2)

            let to1 = CGPoint(x: midpoint + 60, y: 0)
            let control3 = CGPoint(x: midpoint + 25, y: -25)
            let control4 = CGPoint(x: midpoint + 25, y: 0)
            
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}

struct PositionKey: PreferenceKey{
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func viewPostion(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    
                    Color.clear
                        .preference(key: PositionKey.self, value: rect)
                        .onPreferenceChange(PositionKey.self, perform: completion)
                }
            }
    }
}
enum Tab: String, CaseIterable {
    case home = "Home"
    case weather = "weather"
    case shop = "shop"
    case profile = "profile"
    case fishes = "fishes"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house.fill"
            
        case .weather:
            return "cloud.sun.fill"
            
        case .shop:
            return "cart.fill"
            
        case .profile:
            return "person.fill"
        case .fishes:
            return "fish.fill"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
