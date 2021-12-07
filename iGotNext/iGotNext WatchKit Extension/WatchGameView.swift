//
//  WatchGameView.swift
//  iGotNext WatchKit Extension
//
//  Created by Burhan Faquiri on 2021-12-07.
//

import SwiftUI
struct GameView : View{
    var game : Game
    var body : some View{
        VStack{
            //Text("Location: \(game.location?.latitude ?? defaultLocation.latitude) & \(game.location?.longitude ?? defaultLocation.longitude)")
            Text("Game type: \(game.gameType ?? "No game type")")
            Text("Start time: \(game.startTime ?? Date())")
            Text("End time: \(game.endTime ?? Date())")
            Text("Number of spots available: \(game.numOfPlayers ?? 0) / \(game.maxPlayers ?? 0)")
        }
    }
}

struct WatchGameView: View {
    let viewModel : WatchGameViewModel
    @State var games : [Game] = []
    
    var body: some View {
        VStack{
            Text("Game from iPhone")
            
            List(games, id:\.self ){ g in
                GameView(game: g)
            }

    } .onAppear(){
        // Step 5d - initialize connection between watch and phone
        // Step 5e - request data and deserialize data from phone
        viewModel.connectivityProvider.connect()
        self.games = viewModel.connectivityProvider.receivedGames
}
    }
}
