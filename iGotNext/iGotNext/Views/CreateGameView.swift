//
//  CreateGameView.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//

import SwiftUI

//uses struct from home page

struct CreateGameView: View {
    
    @State var newGame = Game()
    @State var gameType : String = ""
    @State var startTime: String = ""
    @State var endTime: String = ""
    @State var latitude: String = ""
    @State var longitude: String = ""
    
    @State var numOfPlayers: String = ""
    
    
    var body: some View {
        VStack{
            //TODO: Change to a picker
            TextField("Game type", text: $gameType)
            TextField("Start time", text: $startTime)
            TextField("End time", text: $endTime)
            TextField("Latitude", text: $latitude)
            TextField("Longitude", text: $longitude)
            TextField("Number of players", text: $numOfPlayers)
            
            Button(action: {
                addGameData()
            }){
                Text("Add game")
            }
            
        }.navigationTitle("Create a game")
    }
    
    func addGameData(){
        newGame.gameType = gameType
        
        //TODO: Add type checking
        newGame.startTime = Double(startTime)
        newGame.endTime = Double(endTime)
        //newGame.location = CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)
        //newGame.numOfPlayers
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView()
    }
}
