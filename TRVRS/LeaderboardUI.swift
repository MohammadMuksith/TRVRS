//
//  LeaderboardUI.swift
//  TRVRS
//
//  Created by Mohammad Muksith on 2/21/23.
//

import SwiftUI
import GameKit


struct  Ring: View {
    let lineWidth: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let percent: Double
    var body: some View {
       
            

                   
                        ZStack{
                            
                           
                            RingShape()
                                .stroke(style: StrokeStyle(lineWidth: lineWidth ))
                                .fill(backgroundColor)
                            RingShape(percent: percent)
                                .stroke(style: StrokeStyle(lineWidth: lineWidth , lineCap: .round))
                                .fill(foregroundColor)
                        }
                        .frame(width: 330, height: 380)
                        
                    


            
        
       
    }
}




