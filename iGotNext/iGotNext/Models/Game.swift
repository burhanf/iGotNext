//
//  Game.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-04.
//

import UIKit
import MapKit

class Game: NSObject {
    let id = UUID()
    var gameType : String?
    var startTime : Date?
    var endTime : Date?
    //TODO use geolocation to get coordinates from a text input
    var location : CLLocationCoordinate2D?
    
    var maxPlayers : Int?
    var numOfPlayers : Int?
    var skillLevel : String?
    
    //ctor
    init(gameType : String, startTime : Date, endTime : Date, loc : CLLocationCoordinate2D, max : Int, numPlayers : Int, skill : String) {
        self.gameType = gameType
        self.startTime = startTime
        self.endTime = endTime
        self.location = loc
        self.maxPlayers = max
        self.numOfPlayers = numPlayers
        self.skillLevel = skill
    
        super.init()
    }
}
    
    //TODO get the location lat and long from a text user input
