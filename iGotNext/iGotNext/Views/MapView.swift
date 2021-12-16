//
//  Map.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var games:[Game] = []
    @StateObject private var locationViewModel = LocationViewModel()
    @State var showingModal = false
    @ObservedObject private var gameViewModel = GameViewModel()
    var body: some View {
        VStack{
            Map(coordinateRegion: $locationViewModel.region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: games)
            {item in
                MapAnnotation(coordinate: item.location!) {
                    
                    Button(action: {
                        
                        self.showingModal.toggle()
                    }) {
                        Image("\(item.gameType!.lowercased())icon")
                            .resizable()
                            .background(Color.white).clipShape(RoundedRectangle(cornerRadius: 25,style: .continuous))
                            .frame(width: 30, height: 30, alignment: .center)
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
