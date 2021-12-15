//
//  ContentView.swift
//  iGotNext WatchKit Extension
//
//  Created by Burhan Faquiri on 2021-11-21.
//This view is the entry point for the watch and starts the connection between the watch and phone

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
            //connect to phone
            connect.connect()
        }
    }
}

