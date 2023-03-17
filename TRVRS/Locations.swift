//
//  Sports.swift
//  TRVRS
//
//  Created by Mohammad Muksith on 2/10/23.
//

import SwiftUI
import MapKit
import GameKit

enum Authenticate {
    static func user() {
        let localPlayer = GKLocalPlayer.local
        localPlayer.authenticateHandler = { _, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            GKAccessPoint.shared.location = .topLeading
            GKAccessPoint.shared.isActive = localPlayer.isAuthenticated
        }
    }
}


struct MapView: View {
    @State private var showText = false
    @StateObject private var locationManager = LocationManager()
    @State private var showingSheet: Location? = nil
    @State private var sports = false
    @State private var history = false
    @State private var food = false
    @State private var music = false
    @State private var mapRegion=MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458),span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    let locations = Location.testData
    
    var filteredLocations: [Location] {
        return locations.filter ({ (location) -> Bool in
            
            if sports && location.type == .sports {
                return true
            }
            else if history && location.type == .history
            {
                return true
            }
            else if food && location.type == .food{
                return true
            }
            else if music && location.type == .music{
                return true
            }
            
            return false
            
            
        })
        
        
    }
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Map(coordinateRegion: $mapRegion, showsUserLocation: true, annotationItems: filteredLocations){
                    location in MapAnnotation(coordinate: location.coordinate, anchorPoint: CGPoint(x:0.5, y:1.0)){
                        Button{
                            showingSheet = location
                        } label:{
                            Image(location.type.imageName)
                        }
                        .sheet(item: self.$showingSheet, content: { showingSheet in
                            ScrollView{
                                VStack{
                                    Spacer()
                                    HStack(spacing: 0.1){
//                                      Spacer()
                                        Text(showingSheet.name)
                                            .font(.title)
                                            .padding()
                                         
                                        Button(action:{
                                            openmap(Address: showingSheet.Adderess)
                                        }){
                                            Image(systemName: "car.circle")
                                                .foregroundColor(.blue)
                                                .font(.title2)
                                                .padding()
                                                
                                        }
                                    }
                                    Image(showingSheet.image)
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                    Text(showingSheet.description)
                                        .padding()
                                     
                                    Button("Complete"){
                                        
                                        if sports && location.type == .sports {
                                            Progress.sports_progress += 1/3
                                        }
                                        if history && location.type == .history
                                        {
                                        Progress.history_progress += 1/4
                                        }
                                        if food && location.type == .food{
                                            Progress.food_progress += 1/4
                                        }
                                        if music && location.type == .music{
                                            Progress.music_progress += 1/4
                                        }
                                        
                                        
                                    }
                                    .tint(Color("TRVRSB"))
                                    
                                }
                                
                                .padding()
                                
                                
                            }
                        })
                        
                        
                        
                    }
                    
                    
                }
                .ignoresSafeArea()
                .tint(Color("TRVRSB"))
                HStack {
                    Spacer(minLength: 150)
                    HStack{
                        Button(action: {
                            showText.toggle()
                        })
                        {
                            ZStack{
                                Image("x")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 100)
                                    .padding()
                                Image("z")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 43, height: 100)
                                    .padding()
                            }


                        }
                        .tint(Color("TRVRSO"))
                        
                        if showText {
                            VStack{
                                Toggle(isOn: $sports){
                                    
                                    HStack{
                                        Spacer()
                                        Text("Sports")
                                            .foregroundColor(Color(.systemGray))
                                        
                                            .font(.title2)
                                        
                                    }
                                    
                                }
                                
                                .tint(Color(.systemGray))
                                
                                
                                Toggle( isOn: $history){
                                    HStack{
                                        Spacer()
                                        Text("History")
                                            .foregroundColor(Color("TRVRSGR"))
                                            .font(.title2)
                                    }
                                    
                                }
                                
                                
                                .tint(Color("TRVRSGR"))
                                
                                Toggle(isOn: $food){
                                    HStack{
                                        Spacer()
                                        Text("Food")
                                            .foregroundColor(Color("TRVRSO"))
                                            .font(.title2)
                                    }
                                    
                                }
                                
                                .tint(Color("TRVRSO"))
                                
                                
                                Toggle(isOn: $music){
                                    HStack{
                                        Spacer()
                                        Text("Music")
                                            .foregroundColor(Color("TRVRSB"))
                                            .font(.title2)
                                        
                                    }
                                    
                                    
                                }
                                .tint(Color("TRVRSB"))
//                                Spacer()
                            }
                            .background(RoundedRectangle(cornerRadius: 10)
                                .frame(width: 259, height: 167)
                                .foregroundColor(.white)
                                .offset(x: 41, y: 0)
                                .opacity(0.8)
                            )
                            
                            .padding(7)
                        }
//                        Spacer()
                    }
                }

                
                
                
            }
            
            
        }
        .onAppear() { Authenticate.user()}
        
    }
    func openmap(Address: String){
        UIApplication.shared.openURL(NSURL(string: "http://maps.apple.com/?address=\(Address)")! as URL)
    }

}




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

