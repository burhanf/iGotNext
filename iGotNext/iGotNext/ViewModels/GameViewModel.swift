//
//  GameViewModel.swift
//  iGotNext
//
//  Created by Michael Wright on 2021-11-26.
//

import UIKit
import MapKit
import FirebaseFirestore



struct GameTest: Identifiable{
    let id = UUID()
    var gameType : String?
    var startTime : Double?
    var endTime : Double?
}

//ref: https://www.youtube.com/watch?v=f6u3AnOKZd0
class GameViewModel: ObservableObject {

    @Published var games = [Game]()
    
    private let db = Firestore.firestore()

    func fetchData(){
        db.collection("Game").addSnapshotListener { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
                }
            
            self.games = documents.map { (queryDocumentSnapshot) -> Game in
                let data = queryDocumentSnapshot.data()
                
                let gameType = data["GameType"]  as? String ?? ""
                let startTime = (data["StartTime"] as? Timestamp)?.dateValue() ?? Date()
                let endTime = (data["EndTime"] as? Timestamp)?.dateValue() ?? Date()
                //let endTime = data["EndTime"]
                let location = data["Location"] as! GeoPoint
                
//                print(gameType)
//                print(startTime)
//                print(endTime)
//                print(location)
                //print(location[1])
                
                let game = Game(gameType: gameType, startTime: startTime, endTime: endTime, location: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                
                print(self.games.count)
                
                return game
//                let book = GameTest(gameType: gameType, startTime: (Double)startTime, endTime: (Double)endTime)
            }
            }
        }
    
    
}
