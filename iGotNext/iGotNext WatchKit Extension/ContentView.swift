//
//  ContentView.swift
//  iGotNext WatchKit Extension
//
//  Created by Burhan Faquiri on 2021-11-21.
//

import SwiftUI





struct ContentView: View {
    let viewModel = WatchGameViewModel(connectivityProvider: ConnectionProvider())
    
    let connect = ConnectionProvider()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Watch from iPhone")
                NavigationLink(destination: WatchGameView(viewModel: viewModel)){
                    Text("Game from iPhone")
                }
            }
        }
        .onAppear(){
            //ON WATCH SIDE, NEED TO CONNECT TO PHONE TO SEND TO IT
            connect.connect()
        }
    }
}

