//
//  Progress.swift
//  TRVRS
//
//  Created by Mohammad Muksith on 2/10/23.
//

import SwiftUI

struct Progress: View {
    
//    public static var overall_progress = 0.0
    public static var sports_progress = 0.0
  public static var history_progress = 0.0
    public static var food_progress = 0.0
    public static var music_progress = 0.0
    @State private var update = 0.0

       var body: some View {
           VStack {
//               HStack{
//                   
////                   ProgressView(value: Progress.overall_progress){
////
////                       Text("Overall")
////                           .foregroundColor(Color(.red))
////                           .tint(.red)
////                           .font(.largeTitle)
////
////
////                   }
//                   .tint(.red)
//                   .padding()
//               }
//              
               HStack{
                   ProgressView(value: Progress.sports_progress){
                       Text("Sports")
                           .foregroundColor(Color(.systemGray))
                           .tint(Color(.systemGray))
                           .font(.largeTitle)
//                      Button("Sports") { sports_progress += 0.05 }
                
                   }
//                   .foregroundColor(Color(.systemGray))
//                   .tint(Color(.systemGray))
//                   .font(.largeTitle)
                   .tint(Color(.systemGray))
                       .padding()
                   
               }
               HStack{
                   ProgressView(value: Progress.history_progress){
                       Text("History")
                           .foregroundColor(Color("TRVRSGR"))
                           .tint(Color("TRVRSGR"))
                           .font(.largeTitle)
                   }
                   .tint(Color("TRVRSGR"))
                       .padding()
                   
               }
               HStack{
                   ProgressView(value: Progress.food_progress){
                       Text("Food")
                           .foregroundColor(Color("TRVRSO"))
                           .tint(Color("TRVRSO"))
                           .font(.largeTitle)
//                       Button("Food") { Progress.food_progress += 0.05 }
                
                   }
//                   .foregroundColor(Color("TRVRSO"))
//                   .tint(Color("TRVRSO"))
//                   .font(.largeTitle)
                   .tint(Color("TRVRSO"))
                       .padding()
                   
               }
               HStack{
                   ProgressView(value: Progress.music_progress){
                       Text("Music")
                           .foregroundColor(Color("TRVRSB"))
                           .tint(Color("TRVRSB"))
                           .font(.largeTitle)
//                       Button("Music") { Progress.music_progress += 0.05 }
                                           
                   }
//                   .foregroundColor(Color("TRVRSB"))
//                   .tint(Color("TRVRSB"))
//                   .font(.largeTitle)
                   .tint(Color("TRVRSB"))
                       .padding()
                   
               }
              
                  
               ProgressView(value: update){
                   
                   Button("Update") { update += 0.05 }
                                   
           }
//                                       
               
           }
       }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Progress()
    }
}


