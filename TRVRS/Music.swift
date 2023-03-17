//
//  Music.swift
//  TRVRS
//
//  Created by Mohammad Muksith on 2/10/23.
//

import SwiftUI
import MapKit

struct Music: View {
    @State private var mapRegion=MKCoordinateRegion(center:
    CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458),span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    let music_locations=[
        Location(name: "Fox Theatre Detroit", coordinate: CLLocationCoordinate2D(latitude: 42.3385, longitude: -83.0524), description: "", type: .music, color: .music, image: "", Adderess: "" ),
        Location(name: "Motown Museum", coordinate: CLLocationCoordinate2D(latitude: 42.3641, longitude: -83.0884), description: "", type: .music, color: .music, image: "", Adderess: ""),
        Location(name: "Music Hall Center for the Performing Arts", coordinate: CLLocationCoordinate2D(latitude: 42.3370221, longitude: -83.0457728), description: "", type: .music, color: .music, image: "", Adderess: ""),
        Location(name: "Saint Andrew’s Hall", coordinate: CLLocationCoordinate2D(latitude: 42.3323473, longitude: -83.0415954), description: "", type: .music, color: .music, image: "", Adderess: "")
    ]
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: music_locations){
                Location in MapAnnotation(coordinate: Location.coordinate){
                    NavigationLink{
                        VStack{
                            Text(Location.name)
                            Text(Location.description)
                        }
                    }
                label:{
                    Image("M")
                }
                }
                
            }
            .ignoresSafeArea()
        }
    }
}

struct Music_Previews: PreviewProvider {
    static var previews: some View {
        Music()
    }
}

