//
//  Map.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//

import SwiftUI
import MapKit

struct MapView: View {
    // Create an array of games
    @State var games:[Game] = []
    @StateObject private var locationViewModel = LocationViewModel()
    @State var showingModal = false
    @ObservedObject private var gameViewModel = GameViewModel()
    var body: some View {
        VStack{
            Map(coordinateRegion: $locationViewModel.region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: games)
            {item in
                // Fetch the games, take their location field, and create annotations
                MapAnnotation(coordinate: item.location!) {
                    
                    Button(action: {
                        // Display the modal when the annotation is clicked on
                        self.showingModal.toggle()
                    }) {
                        Image("\(item.gameType!.lowercased())icon")
                            .resizable()
                            .background(Color.white).clipShape(RoundedRectangle(cornerRadius: 25,style: .continuous))
                            .frame(width: 30, height: 30, alignment: .center)
                        // Display the modal
                    }.sheet(isPresented: $showingModal, onDismiss: {

                    }) {
                        GameInfoModalView(game:item)
                    }
                }
                
            }
            .accentColor(.pink)
            .onAppear{
                locationViewModel.checkIfLocationServicesISEnabled()
                if(games.isEmpty){
                    gameViewModel.fetchData()
                }
                // bind onChange when a game gets fetched
            }.onChange(of: gameViewModel.games) { games in
                for game in games{
                    self.games.append(game)
                }
            }
        }
    }
}
extension MKPointAnnotation{
    
}
struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
