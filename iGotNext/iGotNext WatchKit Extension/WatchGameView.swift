//
//  WatchGameView.swift
//  iGotNext WatchKit Extension
//
//  Created by Burhan Faquiri on 2021-12-07.
//

import SwiftUI
struct GameView : View{
    var game : WatchGame
    var body : some View{
        VStack{
            //Text("Location: \(game.location?.latitude ?? defaultLocation.latitude) & \(game.location?.longitude ?? defaultLocation.longitude)")
            Text("\(game.weather ?? "No weather")")
            Text("\(game.satisfactionLevel ?? "No satisfaction")")
        }
    }
}

struct WatchGameView: View {
    @ObservedObject var viewModel : WatchGameViewModel
    @State var games : [WatchGame] = []
    
    var body: some View {
        VStack{
            Text("Send game details to phone")
            
            List(games, id:\.self ){ g in
                GameView(game: g)
            }

    } .onAppear(){
        print("WATCH ON APPEAR")
        // Step 5d - initialize connection between watch and phone
        // Step 5e - request data and deserialize data from phone
        viewModel.connectivityProvider.connect()
        
        viewModel.connectivityProvider.initFakeDetails()
        
        self.games = viewModel.connectivityProvider.games
}
    }
}
