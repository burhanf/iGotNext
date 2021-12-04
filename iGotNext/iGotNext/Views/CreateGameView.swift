//
//  CreateGameView.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//

import SwiftUI
import MapKit

//uses struct from home page

struct CreateGameView: View {
    @State var selectedType = "Volleyball"
    @State var start: Date = Date()
    @State var end: Date = Date()
    
    //state var for dob date picker
    var dateFormatter : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @State var gameLocation : String = ""
    
    @State var lat: Double = 0.0
    @State var long: Double = 0.0
    
    @State var numOfPlayers: String = "0"
    @State var maxNum: String = ""
    @State var selectedSkill = "Advanced"
    
    var gameTypes = ["Soccer", "Basketball", "Volleyball", "Football", "Tennis"]
    var skillLevels = ["Beginner", "Intermediate", "Advanced", "Expert"]
    
    //instance of viewmodel
    @ObservedObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack{
            //Reference: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-picker-and-read-values-from-it
            Picker("Select game type", selection: $selectedType){
                ForEach(gameTypes, id: \.self){
                    Text($0)
                }
            }
            
            //date picker for start
            DatePicker(selection: $start, in: Date()...){
                Text("Start time:")
            }
            
            //date picker for end
            DatePicker(selection: $end, in: Date()...){
                Text("End time:")
            }
            
            TextField("Location", text: $gameLocation)
                
            TextField("Number of players", text: $numOfPlayers)
                .keyboardType(.numberPad)
            TextField("Max number of players", text: $maxNum)
                .keyboardType(.numberPad)
            
            Picker("Select skill level", selection: $selectedSkill){
                ForEach(skillLevels, id: \.self){
                    Text($0)
                }
            }
            
            Button(action: {
                findCoordinates()
                //TODO: need to retrieve location coordinates before adding the game to db
                
            }){
                Text("Add game")
            }
            
        }.navigationTitle("Create a game")
    }
    
    func addGameData(){
        //Reference: https://firebase.google.com/docs/firestore/manage-data/add-data#swift
        //convert types of the text inputs to appropiate type
//        let properLat = Double(lat)
//        let properLong = Double(long)
        //var properStart = Double(start) ?? 0.00
        //var properEnd = Double(end) ?? 0.00
        
        let properNumPlayers = Int(numOfPlayers) ?? 0
        let properMax = Int(maxNum) ?? 0
        
        //var newGame = Game(gameType: type, startTime: Date(), endTime: Date(), loc: CLLocationCoordinate2D(latitude: properLat, longitude: properLong), max: properMax, numPlayers: properNumPlayers, skill: skill)
        viewModel.addData(gameType: selectedType, startTime: start, endTime: end, lat: self.lat, long: self.long, numberOfPlayers: properNumPlayers, maxNumberOfPlayers: properMax, skillLevel: selectedSkill)
    }
    
    func findCoordinates(){
        //use geolocation to find the coordinates of the location
        let geocoder = CLGeocoder()
        var coordinates : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        
        geocoder.geocodeAddressString(gameLocation, completionHandler: {
            (placemarks, error) -> Void in
            if ( (error) != nil ){
                print("Error at location geocode")
            }
            
            if let placemark = placemarks?.first{
                //get the first location that comes up for the user's entered location
                coordinates = placemark.location!.coordinate

                print(coordinates)
                //set the coordinates
                lat = coordinates.latitude
                long = coordinates.longitude
                addGameData()
            }
        })
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView()
    }
}
