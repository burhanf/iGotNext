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
    public static var supportsSecureCoding: Bool = true
    
    let id = UUID()
    @Published var weather : String?
    @Published var satisfactionLevel : String?
    
    //ctor
    func initWithData(weather : String, satisfactionLevel : String) {
        self.weather = weather
        self.satisfactionLevel = satisfactionLevel

    }
    
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
    public func encode(with coder: NSCoder) {
        coder.encode(self.weather, forKey: "weather")
        coder.encode(self.satisfactionLevel, forKey: "satisfactionLevel")
        
    }

}
