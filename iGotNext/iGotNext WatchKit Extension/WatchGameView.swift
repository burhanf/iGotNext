//
//  WatchGameView.swift
//  iGotNext WatchKit Extension
//
//  Created by Burhan Faquiri on 2021-12-07.
//This view is the where the user will enter information (weather and satisfaction of the game being played) and send to the phone to be displayed

import SwiftUI

struct WatchGameView: View {
    //watch view model object
    @ObservedObject var viewModel : WatchGameViewModel
    
    //state vars to hold the user entered information
    @State var weather = ""
    @State var satisfaction = ""
    
    var body: some View {
        VStack{
            Text("Send game details to phone")
            
            TextField("Weather", text: $weather)
            TextField("Satisfaction Level", text: $satisfaction)
            
            Button(action: {
                sendData()
            }){
                Text("Send to Phone")
            }

    } .onAppear(){
        // initialize connection between watch and phone
        // send data to phone
        viewModel.connectivityProvider.connect()
        
}
    }
    
    //function to send the data over to the phone
    func sendData(){
        viewModel.connectivityProvider.initDetails(weather: weather, satisfactionLevel: satisfaction)
    }
}
