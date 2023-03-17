//
//  MainScreen.swift
//  TRVRS
//
//  Created by Mohammad Muksith on 2/14/23.
//


import SwiftUI
import GameKit

struct MainScreenView: View {
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color(.white))
    }
    
    
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            

            Progress()
                .tabItem {
                    Label("My Progress", systemImage: "chart.pie")
                }
           
                w()
                .tabItem {
                    Label("My Progress", systemImage: "person")
                }
            
            
        }
        .accentColor(Color("TRVRSB"))
    }
    
}










struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
