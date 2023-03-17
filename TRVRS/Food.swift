//
//  Food.swift
//  TRVRS
//
//  Created by Mohammad Muksith on 2/10/23.
//

import SwiftUI
import MapKit

struct Food: View {
    @State private var mapRegion=MKCoordinateRegion(center:
    CLLocationCoordinate2D(latitude: 42.3314, longitude: -83.0458),span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    let food_locations=[
        Location(name: "Yum Village", coordinate: CLLocationCoordinate2D(latitude: 42.3693447, longitude: -83.072362), description: "", type: .food, color: .food, image: "", Adderess: "" ),
        Location(name: "Lafayette Coney Island", coordinate: CLLocationCoordinate2D(latitude: 42.3314078, longitude:  -83.048825), description: "", type: .food, color: .food, image: "", Adderess: ""),
        Location(name: "Dime Store", coordinate: CLLocationCoordinate2D(latitude: 42.3309932, longitude: -83.0478905), description: "", type: .food, color: .food, image: "", Adderess: ""),
        Location(name: "Highlands", coordinate: CLLocationCoordinate2D(latitude: 42.3289529, longitude: -83.0397403), description: "", type: .food, color: .food, image: "", Adderess: "")
    ]
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: food_locations){
                Location in MapAnnotation(coordinate: Location.coordinate){
                    NavigationLink{
                        VStack{
                            Text(Location.name)
                            Text(Location.description)
                        }
                    }
                label:{
                    Image("F")
                }
//                    ContentView()
                    
                }
                
            }
            
            
        }
    }

}

//struct Food_Previews: PreviewProvider {
//    static var previews: some View {
//        Food()
//    }
//}
struct Grape: Identifiable {
    let id = UUID()
    let name: String
    let isRed: Bool
}

struct ContentView: View {
    @State private var AGrapes: [Grape] = [Grape(name: "Merlot", isRed: true), Grape(name: "Cabernet Sauvignon", isRed: true), Grape(name: "Pinot Noir", isRed: true), Grape(name: "Albariño", isRed: false), Grape(name: "Sauvignon Blanc", isRed: false)]

    @State private var hideReds = false
    @State private var hideWhitess = false

    var body: some View {
        VStack {
            HStack {
                Toggle(isOn: $hideReds) {
                    Text("Hide reds").foregroundColor(.red)
                }
                .padding(.horizontal, 30)

                Toggle(isOn: $hideWhitess) {
                    Text("Hide whites").foregroundColor(.blue)
                }.padding(.horizontal, 22)

            }

            List {
                Section {
                    ForEach(AGrapes.filter({ return (!self.hideWhitess && !$0.isRed) || (!self.hideReds && $0.isRed) })) { grape in GrapeCell(grape: grape)
                    }
                }

            }
        }
    }
}

struct GrapeCell: View {
    let grape: Grape

    var body: some View {
        HStack {
            Circle().fill(grape.isRed ? Color.red : Color.green).frame(width: 30)
            Text(grape.name)
            Spacer()
        }

    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Food()
    }
}

