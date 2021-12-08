//
//  ContentView.swift
//  iGotNext WatchKit Extension
//
//  Created by Burhan Faquiri on 2021-11-21.
//

import SwiftUI





struct ContentView: View {
    let viewModel = WatchGameViewModel(connectivityProvider: ConnectionProvider())
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Watch from iPhone")
                NavigationLink(destination: WatchGameView(viewModel: viewModel)){
                    Text("Game from iPhone")
                }
            }
        }
    }
}

