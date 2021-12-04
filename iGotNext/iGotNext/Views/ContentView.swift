//
//  ContentView.swift
//  iGotNext
//
//  Created by Michael Wright on 2021-11-11.
//

import SwiftUI

struct ContentView: View {
    @State var loginToggle = false
    
    //SAVE LOGGED IN USER HERE TO PASS IT INTO USERPROFILE
//    var loggedInUser : User
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    NavigationLink(destination: Login(),isActive: $loginToggle){
                        Button("Login"){
                            loginToggle = true // Programatically navigate
                        }
                    }
                    NavigationLink(destination: Signup()){
                        Text("Signup")
                    }
                    NavigationLink(destination: MapView()){
                        Text("Map")
                    }
                    NavigationLink(destination: HomePage()){
                        Text("Home")
                    }
                    
                    NavigationLink(destination: UserProfile()){
                        Text("User Profile")
                    }
                    
                    NavigationLink(destination: CreateGameView()){
                        Text("Create Game")
                    }
                    // swift being swift
                    Group {
                        NavigationLink(destination: GameInformationView()){
                            Text("Game Information")
                        }
                        
                        NavigationLink(destination: ReviewsView()){
                            Text("Reviews")
                        }
                        NavigationLink(destination: FriendsView()){
                            Text("Friends")
                        }
                        NavigationLink(destination: HistoryView()){
                            Text("History")
                        }
                        NavigationLink(destination: GameInfoModalView()){
                            Text("Modal")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
