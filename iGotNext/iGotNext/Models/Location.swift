//
//  Location.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//

import Foundation
import MapKit
struct Location: Identifiable{
    let id = UUID()
    let name : String
    let coordinate: CLLocationCoordinate2D
}
