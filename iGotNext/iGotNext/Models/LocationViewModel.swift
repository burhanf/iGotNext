//
//  LocationViewModel.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//

import Foundation
import MapKit
import SwiftUI
final class LocationViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion() {
        willSet { objectWillChange.send() }
    }
    var locationManager: CLLocationManager?
    func checkIfLocationServicesISEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            
        }else{
            print("show an alert")
        }
    }
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else{ return }
        switch locationManager.authorizationStatus {
        
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            print("You have restricted the app location permission")
        case .denied:
            print("You have denied the app location permission")
        case .authorizedWhenInUse,.authorizedAlways:
            region = MKCoordinateRegion(center: locationManager.location?.coordinate ?? (region.center), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        @unknown default:
            break
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
