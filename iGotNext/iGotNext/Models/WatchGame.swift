//
//  WatchGame.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-07.
//

import UIKit
import MapKit
import Foundation

class WatchGame: NSObject, ObservableObject ,NSSecureCoding {
    public static var supportsSecureCoding: Bool = true
    
    let id = UUID()
    @Published var gameType : String?
    @Published var maxPlayers : String?
    @Published var numOfPlayers : String?
    @Published var skillLevel : String?
    
    //ctor
    func initWithData(gameType : String, max : String, numPlayers : String, skill : String) {
        self.gameType = gameType
        self.maxPlayers = max
        self.numOfPlayers = numPlayers
        self.skillLevel = skill
    
//        super.init()
    }
    
    public required convenience init?(coder decoder: NSCoder) {
        
        guard let gameType = decoder.decodeObject(forKey: "gameType") as? String,
            let maxPlayers = decoder.decodeObject(forKey: "maxPlayers") as? String,
            let numOfPlayers = decoder.decodeObject(forKey: "numOfPlayers") as? String,
            let skillLevel = decoder.decodeObject(forKey: "skillLevel") as? String
            else { return nil }
        
        self.init()
        self.initWithData(
            gameType: gameType as String,
            max : maxPlayers as String,
            numPlayers : numOfPlayers as String,
            skill : skillLevel as String
        )
    }
    public func encode(with coder: NSCoder) {
        coder.encode(self.gameType, forKey: "gameType")
        coder.encode(self.maxPlayers, forKey: "maxPlayers")
        coder.encode(self.numOfPlayers, forKey: "numOfPlayers")
        coder.encode(self.skillLevel, forKey: "skillLevel")
        
    }

}
