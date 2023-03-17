//
//  History.swift
//  TRVRS
//
//  Created by Mohammad Muksith on 2/10/23.
//

import SwiftUI
import MapKit

struct History: View {
    @State private var mapRegion=MKCoordinateRegion(center:
    CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458),span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    let history_locations=[
        Location(name: "Campus Martius Park", coordinate: CLLocationCoordinate2D(latitude: 42.3319, longitude: -83.0466), description: "", type: .history, color: .history, image: "", Adderess: "" ),
        Location(name: "Joe Louis Fist", coordinate: CLLocationCoordinate2D(latitude: 42.3287, longitude: -83.0445), description: "", type: .history, color: .history, image: "", Adderess: ""),
        Location(name: "Charles H. Wright Museum of African-American History", coordinate: CLLocationCoordinate2D(latitude: 42.3591272, longitude:  -83.060828), description: "", type: .history, color: .history, image: "", Adderess: ""),
        Location(name: "Detroit Institute of Art", coordinate: CLLocationCoordinate2D(latitude: 42.3594, longitude: -83.0645), description: "", type: .history, color: .history, image: "", Adderess: "")
        
        
    ]
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: history_locations){
                Location in MapAnnotation(coordinate: Location.coordinate){
                    NavigationLink{
                        VStack{
                            Text(Location.name)
                            Text(Location.description)
                        }
                    }
                label:{
                    Image("H")
                }
                }
                
            }
            .ignoresSafeArea()
        }
    }
    
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
