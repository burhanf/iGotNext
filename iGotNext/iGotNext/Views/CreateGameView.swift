//
//  CreateGameView.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//This view is responsible for getting the inputs from a user to create a Game event object and saving it to the Firebase db

import SwiftUI
import MapKit
import Firebase

struct CreateGameView: View {
    var userId = Auth.auth().currentUser?.uid
    private let db = Firestore.firestore()
    
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
    
    @State var numOfPlayers: String = ""
    @State var maxNum: String = ""
    @State var selectedSkill = "Advanced"
    
    var gameTypes = ["Soccer", "Basketball", "Volleyball", "Football", "Tennis"]
    var skillLevels = ["Beginner", "Intermediate", "Advanced", "Expert"]
    
    //instance of viewmodel
    @ObservedObject private var viewModel = GameViewModel()
    
    //instance of viewmodel
    @ObservedObject private var userViewModel = UserViewModel()
    
    //add a game to 
    var auth = Auth.auth().currentUser?.uid
    var loggedInUser = User(firstName: "Default", lastName: "Default", age: 99, skill: "Default")
    
    var body: some View {
        VStack{
            //Reference: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-picker-and-read-values-from-it
            Picker("Select game type", selection: $selectedType){
                ForEach(gameTypes, id: \.self){
                    Text($0)
                }
            }
            Text("Skill level:")
            Picker("Select skill level", selection: $selectedSkill){
                ForEach(skillLevels, id: \.self){
                    Text($0)
                }
            }
            TextField("Location", text: $gameLocation)
                .padding(5)
            //date picker for start
            DatePicker(selection: $start, in: Date()...){
                Text("Start time:")
            }
    
            //date picker for end
            DatePicker(selection: $end, in: Date()...){
                Text("End time:")
            }
        
            TextField("Number of players", text: $numOfPlayers)
                .keyboardType(.numberPad)
                .padding(5)
            TextField("Max number of players", text: $maxNum)
                .keyboardType(.numberPad)
                .padding(5)
            
            
            
            Button(action: {
                //Find coordinates of game location from the user's input
                findCoordinates()
            }){
                Text("Add game")
            }
            
        }.navigationTitle("Create a game")
    }
    
    func addGameData(){
        //Reference: https://firebase.google.com/docs/firestore/manage-data/add-data#swift
        
        let properNumPlayers = Int(numOfPlayers) ?? 0
        let properMax = Int(maxNum) ?? 0
        
        //game needs to be added to the logged in user's list of games too
            viewModel.addData(gameType: selectedType, startTime: start, endTime: end, lat: self.lat, long: self.long, numberOfPlayers: properNumPlayers, maxNumberOfPlayers: properMax, skillLevel: selectedSkill, creator: userId ?? "No user id")
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
