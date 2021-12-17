//
//  GameViewModel.swift
//  iGotNext
//
//  Created by Michael Wright on 2021-11-26.
//

import UIKit
import MapKit
import FirebaseFirestore



//struct GameTest: Identifiable{
//    let id = UUID()
//    var gameType : String?
//    var startTime : Double?
//    var endTime : Double?
//}

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
                
                let max = data["MaxPlayers"] as? Int ?? 0
                let skill = data["SkillLevel"] as? String ?? ""
                let totalNum = data["NumberOfPlayers"] as? Int ?? 0
                
//                print(gameType)
//                print(startTime)
//                print(endTime)
//                print(location)
                //print(location[1])
                
                let game = Game()
                game.initWithData(gameType: gameType, startTime: startTime, endTime: endTime, loc: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), max: max, numPlayers: totalNum, skill: skill)
                
                print(self.games.count)
                
                return game
//                let book = GameTest(gameType: gameType, startTime: (Double)startTime, endTime: (Double)endTime)
            }
            }
        }
    
    //Reference: https://firebase.google.com/docs/firestore/manage-data/add-data#swift
    func addData(gameType : String, startTime : Date, endTime : Date, lat : Double, long : Double, numberOfPlayers : Int, maxNumberOfPlayers : Int, skillLevel : String, creator: String){
        //add a new document to the Game collection
        var referenceOfNewDocument: DocumentReference? = nil
        //Reference: https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/GeoPoint
        referenceOfNewDocument = db.collection("Game").addDocument(data: [
            "EndTime" : Timestamp(date: endTime),
            "StartTime" : Timestamp(date: startTime),
            "GameType" : gameType,
            "Location" : GeoPoint(latitude: lat, longitude: long),
            "MaxPlayers" : String(maxNumberOfPlayers),
            "NumberOfPlayers" : String(numberOfPlayers),
            "SkillLevel" : skillLevel,
            "Creator": creator
            
        ]){ err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(referenceOfNewDocument!.documentID)")
            }
            
        }
    }
    
    
}
