//
//  WatchGame.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-07.
//This class represents the extra game information that is sent from the Watch to the phone

import UIKit
import MapKit
import Foundation

class WatchGame: NSObject, ObservableObject ,NSSecureCoding {
    //does the class support secure coding
    public static var supportsSecureCoding: Bool = true
    
    let id = UUID()
    //the data that is going to be sent
    @Published var weather : String? //the weather when the game was played, in celsius
    @Published var satisfactionLevel : String? //the users satisfaction level from playing the game
    
    //constructor
    func initWithData(weather : String, satisfactionLevel : String) {
        self.weather = weather
        self.satisfactionLevel = satisfactionLevel

    }
    
    //function to decode the data sent
    public required convenience init?(coder decoder: NSCoder) {
        
        guard let weather = decoder.decodeObject(forKey: "weather") as? String,
            let satisfactionLevel = decoder.decodeObject(forKey: "satisfactionLevel") as? String
            else { return nil }
        
        self.init()
        self.initWithData(
            weather: weather as String,
            satisfactionLevel : satisfactionLevel as String
        )
    }
    //function to encode the data sent
    public func encode(with coder: NSCoder) {
        coder.encode(self.weather, forKey: "weather")
        coder.encode(self.satisfactionLevel, forKey: "satisfactionLevel")
        
    }

}
