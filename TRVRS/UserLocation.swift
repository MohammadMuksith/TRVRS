//
//  UserLocation.swift
//  TRVRS
//
//  Created by Mohammad Muksith on 2/28/23.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

final class LocationManager: NSObject, ObservableObject {
    @Published var location: CLLocation?

    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            DispatchQueue.main.async {
                self.location = location
            }
    }
}


