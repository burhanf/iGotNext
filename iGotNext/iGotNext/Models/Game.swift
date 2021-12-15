//
//  Game.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-04.
//This class represents a game event that is created by the user and saved to the db

import UIKit
import MapKit
import Foundation

class Game: NSObject,Identifiable{
    
    let id = UUID()
    @Published var gameType : String?
    @Published var startTime : Date?
    @Published var endTime : Date?
    @Published var location : CLLocationCoordinate2D?
    
    @Published var maxPlayers : Int?
    @Published var numOfPlayers : Int?
    @Published var skillLevel : String?
    
    //ctor
    func initWithData(gameType : String, startTime : Date, endTime : Date, loc : CLLocationCoordinate2D, max : Int, numPlayers : Int, skill : String) {
        self.gameType = gameType
        self.startTime = startTime
        self.endTime = endTime
        self.location = loc
        self.maxPlayers = max
        self.numOfPlayers = numPlayers
        self.skillLevel = skill
    }
}
