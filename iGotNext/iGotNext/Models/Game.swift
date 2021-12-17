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
    //properties of the game object
    let id = UUID()
    @Published var gameType : String? //type of the game
    @Published var startTime : Date? //start time as a date object
    @Published var endTime : Date? //end time of the game as a date object
    @Published var location : CLLocationCoordinate2D? //location of the game, needs coordinates
    
    @Published var maxPlayers : Int? //the max number of players that can play
    @Published var numOfPlayers : Int? //the current number of players that are attending
    @Published var skillLevel : String? //the skill level the game is meant for
    
    //constructor that will take parameters to create a full game object
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
