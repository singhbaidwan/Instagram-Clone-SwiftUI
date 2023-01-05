//
//  MainView.swift
//  Instagram Clone
//
//  Created by Dalveer singh on 02/01/23.
//

import SwiftUI

struct MainView: View {
    @State var selection:Int = 0
    init(){
        UITabBar.appearance().barTintColor = .white
    }
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    selection == 0 ? Image("home-selected") : Image("home")
                }
                .tag(0)
            
            ReelsView()
                .tabItem {
                    selection == 1 ? Image("reels-selected") : Image("reels")
                }
                .tag(1)
            
            AddMediaView()
                .tabItem {
                    selection == 2 ? Image("add") : Image("add")
                }
                .tag(2)
            
            ActivityView()
                .tabItem {
                    selection == 3 ? Image("heart-selected") : Image("heart")
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    selection == 4 ? Image("user-selected") : Image("user")
                }
                .tag(4)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
