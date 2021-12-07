//
//  Game.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-04.
//

import UIKit
import MapKit
import Foundation

class Game: NSObject{
//    public static var supportsSecureCoding: Bool = true
    
    let id = UUID()
    @Published var gameType : String?
    @Published var startTime : Date?
    @Published var endTime : Date?
    //TODO use geolocation to get coordinates from a text input
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
    
//        super.init()
    }
//    public required convenience init?(coder decoder: NSCoder) {
//
//        guard let gameType = decoder.decodeObject(forKey: "gameType") as? String,
//            let startTime = decoder.decodeObject(forKey: "startTime") as? Date,
//            let endTime = decoder.decodeObject(forKey: "endTime") as? Date,
//            let location = decoder.decodeObject(forKey: "location") as? CLLocationCoordinate2D,
//            let maxPlayers = decoder.decodeObject(forKey: "maxPlayers") as? Int,
//            let numOfPlayers = decoder.decodeObject(forKey: "numOfPlayers") as? Int,
//            let skillLevel = decoder.decodeObject(forKey: "skillLevel") as? String
//            else { return nil }
//
//        self.init()
//        self.initWithData(
//            gameType: gameType as String,
//            startTime: startTime as Date,
//            endTime: endTime as Date,
//            loc : location as CLLocationCoordinate2D,
//            max : maxPlayers as Int,
//            numPlayers : numOfPlayers as Int,
//            skill : skillLevel as String
//        )
//    }
    
//    public func encode(with coder: NSCoder) {
//        coder.encode(self.gameType, forKey: "gameType")
//        coder.encode(self.startTime, forKey: "startTime")
//        coder.encode(self.endTime, forKey: "endTime")
//        coder.encode(self.location, forKey: "location")
//        coder.encode(self.maxPlayers, forKey: "maxPlayers")
//        coder.encode(self.numOfPlayers, forKey: "numOfPlayers")
//        coder.encode(self.skillLevel, forKey: "skillLevel")
//
//    }
//
//    public static func == (lhs: Game, rhs: Game) -> Bool {
//        return (lhs.gameType == rhs.gameType) && (lhs.skillLevel == rhs.skillLevel) ? true : false
//    }
}
    
    //TODO get the location lat and long from a text user input
