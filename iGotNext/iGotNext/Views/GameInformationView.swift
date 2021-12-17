//
//  GameInformationView.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//This view is responsible for displaying the details of a game that was clicked by the user in the home screen
//This view also connects with the Watch app and recieves the extra game information entered in the watch

import SwiftUI
import MapKit

//Game instance would be passed into the view
struct GameInformationView: View {
    //instance of a game object
    @Binding var passedInGame : Game
    
    //default location object incase it is null
    var defaultLocation = CLLocationCoordinate2D(latitude: 0.00, longitude: 0.00)
    
    //the game information entered in the watch is recieved here
    @State var games : [WatchGame] = []
    
    //initialize watch view model
    @ObservedObject var viewModel: WatchGameViewModel
    
    var body: some View {
        ZStack{
            Image(passedInGame.gameType?.lowercased() ?? "noimage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.20)
                
        }
        VStack{
            
            Text("Location: \(passedInGame.location?.latitude ?? defaultLocation.latitude) & \(passedInGame.location?.longitude ?? defaultLocation.longitude)")
                .padding(10)
            Text("Start time: \(passedInGame.startTime ?? Date())")
                .padding(10)
            Text("End time: \(passedInGame.endTime ?? Date())")
                .padding(10)
            Text("Number of spots available: \(passedInGame.numOfPlayers ?? 0) / \(passedInGame.maxPlayers ?? 0)")
                .padding(10)
            
            Group{
                List(games, id:\.self ){ g in
                    Text("\(g.weather ?? "No weather")° C")
                    Text("Enjoyment: \(g.satisfactionLevel ?? "No satisfaction")")
                }
                
            }
            
        }
        .onAppear(){
          //will recieve from watch
          viewModel.connectivityProvider.connect()
          
          self.games = viewModel.connectivityProvider.receivedGames
        }
        .navigationTitle("\(passedInGame.gameType ?? "No game")")
        
        
    }
}
