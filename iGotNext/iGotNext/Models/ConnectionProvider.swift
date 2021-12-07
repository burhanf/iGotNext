//
//  ConnectionProvider.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-07.
//

import UIKit
import WatchConnectivity
import MapKit

// step 2 - implement this class for watch connectivity for both
//          phone and watch sides
class ConnectionProvider: NSObject, WCSessionDelegate {
    
    private let session: WCSession
    var games : [WatchGame] = []
    var receivedGames : [WatchGame] = []
    var lastMessage: CFAbsoluteTime = 0
    
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
    
    func send(message: [String:Any]) -> Void {
        session.sendMessage(message, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func connect() {
            guard WCSession.isSupported() else {
                print("WCSession is not supported")
                return
            }
           
            session.activate()
        }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // do something
    }

    #if os(iOS)
    // these methods are required for iOS but not for watchOS
    func sessionDidBecomeInactive(_ session: WCSession) {
        // do something
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        // do something
    }
    #endif
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("entered didReceiveMessage with no reply handler")
        
        if (message["gameData"] != nil)
        {
             print("gameData no reply handler")
            
            let loadedData = message["gameData"] //result["progData"]
        
            print("gameData no reply handler")
            
          // step 2b - deserialize the data from the watch
            NSKeyedUnarchiver.setClass(WatchGame.self, forClassName: "WatchGame")
            // causes app crash because decode not linked properly error
            // above line of code needed to prevent this crash

            let loadedPerson =   try! NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClasses: [WatchGame.self], from: loadedData as! Data) as? [WatchGame]
                
            self.receivedGames = loadedPerson!
            print("Game received")
            
        }
    }
    
    // step 2c - create fake details to be stored in a custom object -> ProgramObject.swift
    func initFakeDetails()
    {
        
        
        /*  let dateStringFormatFrom = "EEE, MMM dd, hh:mm"
         let dateStringFormatTo = "hh:mm"
         let dateFormatterFrom = DateFormatter()
         let dateFormatterTo = DateFormatter()
         dateFormatterFrom.dateFormat = dateStringFormatFrom
         dateFormatterTo.dateFormat = dateStringFormatTo
         */
        
        games.removeAll()
        let gameObj = WatchGame()
        //TODO this needs to be passed in
        gameObj.initWithData(gameType: "Bball", max: "14", numPlayers: "10", skill: "Beginner")
        games.append(gameObj)
    
        
        // step 6h - send data to watch.
        NSKeyedArchiver.setClassName("WatchGame", for: WatchGame.self)
        let gameData = try! NSKeyedArchiver.archivedData(withRootObject: games, requiringSecureCoding: true)
        sendWatchMessage(gameData)
        
    }
    
    // step 2d - implement brute force messaging method to watch
    func sendWatchMessage(_ msgData:Data) {
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        // if less than half a second has passed, bail out
        if lastMessage + 0.5 > currentTime {
            return
        }
        
        // send a message to the watch if it's reachable
        if (WCSession.default.isReachable) {
            
            print("sendWatchMessage")
            let message = ["gameData": msgData]
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
        
        // update our rate limiting property
        lastMessage = CFAbsoluteTimeGetCurrent()
    }
 
}
