//
//  GameInformationView.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//

import SwiftUI

//Game instance would be passed into the view
struct GameInformationView: View {
    //private var passedInGame = Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60)
    private var passedInGame = Game(gameType: "Basketball", startTime : Date(), endTime: Date())
    
    //, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664), CLLocation not working
    
    
    var body: some View {
        VStack{
            Image("basketball")
                .resizable()
                .frame(width: 300, height: 100, alignment: .top)
            //Text("Location: \(passedInGame.location ?? "No location found")")
            //Text("Start time: \(passedInGame.startTime ?? 1.00)")
            //Text("End time: \(passedInGame.endTime ?? 2.00)")
            Text("Number of spots available: 3/12")
            
        }.navigationTitle("\(passedInGame.gameType ?? "No game")")
    }
}

struct GameInformationView_Previews: PreviewProvider {
    static var previews: some View {
        GameInformationView()
    }
}
