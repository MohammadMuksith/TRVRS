//
//  Leaderboard.swift
//  TRVRS
//
//  Created by Mohammad Muksith on 2/21/23.
//

import SwiftUI

struct w: View {
    public static var overall_progress = 0.0
    @State var sportspercent = 0/3
    @State var historypercent = 0
    @State var foodpercent = 0
    @State var musicpercent = 0
    var body: some View {
        ScrollView{
            VStack{
                ZStack{
                    VStack{
                        Button(action: {w.overall_progress += 33},
                               label: {
                            Text("Sports")
                                .font(.largeTitle)
                                .foregroundColor(Color(.systemGray))
                            
                        })
                        Text("\(Int(w.overall_progress))%")
                        .font(.largeTitle)
                        .foregroundColor(Color(.systemGray))
                    }
                    
                    Ring(lineWidth: 50, backgroundColor: Color(.systemGray).opacity(0.4), foregroundColor: Color(.systemGray), percent: Double(w.overall_progress))
                        .padding(50)
                        .animation(.linear)
                }
                ZStack{
                    VStack{
                        Button(action: {historypercent += 25},
                               label: {
                            Text("History")
                                .font(.largeTitle)
                                .foregroundColor(Color("TRVRSGR"))
                            
                        })
                        Text("\(Int(historypercent))%")
                            .font(.largeTitle)
                            .foregroundColor(Color("TRVRSGR"))
                        
                    }

                    Ring(lineWidth: 50, backgroundColor: Color("TRVRSGR").opacity(0.4), foregroundColor: Color("TRVRSGR"), percent: Double(historypercent))
                        .padding(50)
                        .animation(.linear)
                }
               
                ZStack{
                    VStack{
                        Button(action: {foodpercent += 25},
                               label: {
                            Text("Food")
                                .font(.largeTitle)
                                .foregroundColor(Color("TRVRSO"))
                            
                        })
                        Text("\(Int(foodpercent))%")
                            .font(.largeTitle)
                            .foregroundColor(Color("TRVRSO"))
                        
                    }

                    Ring(lineWidth: 50, backgroundColor: Color("TRVRSO").opacity(0.4), foregroundColor: Color("TRVRSO"), percent: Double(foodpercent))
                        .padding(50)
                        .animation(.linear)
                }
                ZStack{
                    VStack{
                        Button(action: {musicpercent += 25},
                               label: {
                            Text("Music")
                                .font(.largeTitle)
                                .foregroundColor(Color("TRVRSB"))
                            
                        })
                        Text("\(Int(musicpercent))%")
                            .font(.largeTitle)
                            .foregroundColor(Color("TRVRSB"))
                        
                    }
                    Ring(lineWidth: 50, backgroundColor: Color("TRVRSB").opacity(0.4), foregroundColor: Color("TRVRSB"), percent: Double(musicpercent))
                        .padding(50)
                        .animation(.linear)
                }
            }
        
            
        }
    }
}

struct w_Previews: PreviewProvider {
    static var previews: some View {
        w()
    }
}

