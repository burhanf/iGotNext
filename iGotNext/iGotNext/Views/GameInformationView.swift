//
//  GameInformationView.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//

import SwiftUI
import MapKit

//WATCH WILL BE CONNECTED WHEN THE GAME IS VIEWED

//Game instance would be passed into the view
struct GameInformationView: View {
    //private var passedInGame = Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60)
//    private var passedInGame = Game(gameType: "Basketball", startTime : Date(), endTime: Date(), loc: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664), max: 12, numPlayers: 3, skill: "beginner")
    @Binding var passedInGame : Game
    
    //, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664), CLLocation not working
    
    var defaultLocation = CLLocationCoordinate2D(latitude: 0.00, longitude: 0.00)
    
    
    
    
    
    var body: some View {
        VStack{
            Image("basketball")
                .resizable()
                .frame(width: 300, height: 100, alignment: .top)
            Text("Location: \(passedInGame.location?.latitude ?? defaultLocation.latitude) & \(passedInGame.location?.longitude ?? defaultLocation.longitude)")
            Text("Start time: \(passedInGame.startTime ?? Date())")
            Text("End time: \(passedInGame.endTime ?? Date())")
            Text("Number of spots available: \(passedInGame.numOfPlayers ?? 0) / \(passedInGame.maxPlayers ?? 0)")
            
        }
        .navigationTitle("\(passedInGame.gameType ?? "No game")")
        
    }
}

//struct GameInformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameInformationView()
//    }
//}
