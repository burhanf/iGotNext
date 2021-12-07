//
//  Map.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var annotations:[Location] = []
    @StateObject private var locationViewModel = LocationViewModel()
    @ObservedObject private var gameViewModel = GameViewModel()
    var body: some View {
        VStack{
            Map(coordinateRegion: $locationViewModel.region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: annotations)
            {item in
                MapAnnotation(coordinate: item.coordinate) {
                    Image("\(item.name)icon")
                        .resizable()
                        .background(Color.white).clipShape(RoundedRectangle(cornerRadius: 25,style: .continuous))
                        .frame(width: 30, height: 30, alignment: .center)
                }
                
            }
            .accentColor(.pink)
            .onAppear{
                locationViewModel.checkIfLocationServicesISEnabled()
                if(annotations.isEmpty){
                    gameViewModel.fetchData()
                }
            }.onChange(of: gameViewModel.games) { games in
                for game in games{
                    annotations.append(Location(name: game.gameType!, coordinate: game.location!))
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
