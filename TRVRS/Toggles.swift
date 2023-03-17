//
//  ContentView.swift
//  TRVRS
//
//  Created by Mohammad Muksith on 2/10/23.
//

import SwiftUI
import GameKit
struct Toggles: View {
    @State private var sports = false
    @State private var history = false
    @State private var food = false
    @State private var music = false
    
    var body: some View {
        ScrollView{
                VStack {
                    HStack {
                        Text("Toggle Sound")
                        Toggle("Sound", isOn: $sports).labelsHidden()
                        Spacer()
                    }
                    if sports {
                        MapView()
                    }
                    
                    
                    HStack {
                        Text("Toggle Sound")
                        Toggle("Sound", isOn: $history).labelsHidden()
                        Spacer()
                    }                   .tint(Color("TRVRSGR"))
                    if history {
                        History()
                    }
                    HStack {
                        Text("Toggle Sound")
                        Toggle("Sound", isOn: $food).labelsHidden()
                        Spacer()
                    }                   .tint(Color("TRVRSO"))
                    if food {
                        Food()
                    }
                    HStack {
                        Text("Toggle Sound")
                        Toggle("Sound", isOn: $music).labelsHidden()
                        Spacer()
                    }
                    .tint(Color("TRVRSB"))
                    if music {
                        Music()
                    }
                    Spacer()
                       
                }
         
                
                
                
//                .background(
//                RoundedRectangle(cornerRadius: 5)
//                    .foregroundColor(Color.red)
//                    .opacity(0.8)
//              )
          
           
                }
      
        }
}

struct Toggles_Previews: PreviewProvider {
    static var previews: some View {
        Toggles()
    }
}
