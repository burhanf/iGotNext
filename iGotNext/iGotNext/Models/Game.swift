//
//  Game.swift
//  iGotNext
//
//  Created by Michael Wright on 2021-11-27.
//

import UIKit
import MapKit

struct Game: Identifiable{
    let id = UUID()
    var gameType : String?
//    var startTime : Double?
//    var endTime : Double?
    var startTime : Date?
    var endTime : Date?
    var location : CLLocationCoordinate2D?
}
