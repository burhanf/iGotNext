//
//  CreateGameView.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//

import SwiftUI
import MapKit

//uses struct from home page

struct CreateGameView: View {
    @State var type : String = ""
    @State var start: String = ""
    @State var end: String = ""
    @State var lat: String = ""
    @State var long: String = ""
    
    @State var numOfPlayers: String = ""
    @State var maxNum: String = ""
    @State var skill: String = ""
    
    
    var body: some View {
        VStack{
            //TODO: Change to a picker
            TextField("Game type", text: $type)
            TextField("Start time", text: $start)
            TextField("End time", text: $end)
            TextField("Latitude", text: $lat)
            TextField("Longitude", text: $long)
            TextField("Number of players", text: $numOfPlayers)
            TextField("Max number of players", text: $maxNum)
            TextField("Skill level", text: $skill)
            
            Button(action: {
                addGameData()
            }){
                Text("Add game")
            }
            
        }.navigationTitle("Create a game")
    }
    
    func addGameData(){
        //convert types of the text inputs to appropiate type
        var properLat = Double(lat) ?? 0.00
        var properLong = Double(long) ?? 0.00
        var properStart = Double(start) ?? 0.00
        var properEnd = Double(end) ?? 0.00
        
        var properNumPlayers = Int(numOfPlayers) ?? 0
        var properMax = Int(maxNum) ?? 0
        
        var newGame = Game(gameType: type, startTime: Date(), endTime: Date(), loc: CLLocationCoordinate2D(latitude: properLat, longitude: properLong), max: properMax, numPlayers: properNumPlayers, skill: skill)
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView()
    }
}
