//
//  GameInfoModalView.swift
//  iGotNext
//
//  Created by Amirhossein on 2021-11-21.
//

import SwiftUI

struct GameInfoModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var game: Game
    var body: some View {
        
        
        VStack{
            Button("Press to dismiss") {
                presentationMode.wrappedValue.dismiss()
            }.font(.title)
            .padding()
            .background(Color.black)
            Image((game.gameType?.lowercased())!)
                .resizable()
                .frame(width: 300, height: 100, alignment: .top)
            Text("Start time: \(game.startTime ?? Date())").font(.headline)
                .bold()
                    .padding(20)
            Text("End time: \(game.endTime ?? Date())").font(.headline)
                .bold()
                    .padding(20)
            Text("Organized by: Amir").font(.headline)
                .bold()
                    .padding(20)
            Text("Max Players \(game.maxPlayers!)").font(.headline)
                .bold()
                    .padding(20)
            
        }
    }
}


