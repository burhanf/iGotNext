//
//  ConnectionProvider.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-07.
//This class is used to connect the Watch to the phone, the watch sends data to the phone. The data being sent is a WatchGame objects

import UIKit
import WatchConnectivity
import MapKit

//implement this class for watch connectivity for both phone and watch sides
class ConnectionProvider: NSObject, WCSessionDelegate {
    //WCsession
    private let session: WCSession
    
    //will hold a list of games
    var games : [WatchGame] = []
    //holds the recieved games that were sent
    var receivedGames : [WatchGame] = []
    
    //time of last message
    var lastMessage: CFAbsoluteTime = 0
    
    //constructor, initalize the watch session
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        
        // for debug purposes
        #if os(iOS)
            print("Connection Provider Initialized On Phone")
        #endif
       
        #if os(watchOS)
            print("Connection Provider Initialized on Watch")
        #endif
        
        self.connect()
    }
    
    //function that sends data to the other device (which is the phone)
    func send(message: [String:Any]) -> Void {
        session.sendMessage(message, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }
    
    //function that connects the devices
    func connect() {
            guard WCSession.isSupported() else {
                print("WCSession is not supported")
                return
            }
           
            session.activate()
        }
    
    //required methods for watch connection
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }

    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
    }
    #endif
    
    //function that decodes the data sent
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("entered didReceiveMessage with no reply handler")
        
        if (message["gameData"] != nil)
        {
             print("gameData no reply handler")
            
            let loadedData = message["gameData"]
        
            print("gameData no reply handler")
            
          //deserialize the data from the watch
            NSKeyedUnarchiver.setClass(WatchGame.self, forClassName: "WatchGame")

            let loadedPerson =   try! NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClasses: [WatchGame.self], from: loadedData as! Data) as? [WatchGame]
                
            self.receivedGames = loadedPerson!
            print("Game received")
            
        }
    }
    
    //function to create watch game object to be sent
    func initDetails(weather:String, satisfactionLevel: String)
    {
        games.removeAll()
        let gameObj = WatchGame()
        
        gameObj.initWithData(weather: weather, satisfactionLevel: satisfactionLevel)
        games.append(gameObj)
    
        
        //send data to phone
        NSKeyedArchiver.setClassName("WatchGame", for: WatchGame.self)
        let gameData = try! NSKeyedArchiver.archivedData(withRootObject: games, requiringSecureCoding: true)
        sendPhoneMessage(gameData)
        
    }
    
    //function to implement brute force messaging method to phone
    func sendPhoneMessage(_ msgData:Data) {
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        // if less than half a second has passed, bail out
        if lastMessage + 0.5 > currentTime {
            return
        }
        
        // send a message to the phone if it's reachable
        if (WCSession.default.isReachable) {
            
            print("sendPhoneMessage")
            let message = ["gameData": msgData]
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
        
        // update our rate limiting property
        lastMessage = CFAbsoluteTimeGetCurrent()
    }
 
}
