//
//  ContentView.swift
//  iGotNext
//
//  Created by Michael Wright on 2021-11-11.
//

import SwiftUI

struct ContentView: View {
    
    
    //@State var games : [WatchGame] = [] //initially empty
    
    
    
    
    @State var loginToggle = false
    @State var showingModal = false
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
                        //                        NavigationLink(destination: GameInformationView()){
                        //                            Text("Game Information")
                        //                        }
                        
                        NavigationLink(destination: ReviewsView()){
                            Text("Reviews")
                        }
                        NavigationLink(destination: FriendsView()){
                            Text("Friends")
                        }
                        NavigationLink(destination: HistoryView()){
                            Text("History")
                        }
                        Button(action: {
                            self.showingModal.toggle()
                        }) {
                            Text("Show Sheet View")
                        }.sheet(isPresented: $showingModal, onDismiss: {
                            print("Code executed when the sheet dismisses")
                        }) {
                            GameInfoModalView()
                        }
                    }
                }
//                .onAppear(){
//                    //FOR WATCH
//                    //connect when app loads
//                    viewModel.connectivityProvider.connect()
//                    viewModel.connectivityProvider.initFakeDetails()
//                    self.games = viewModel.connectivityProvider.games
//                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
