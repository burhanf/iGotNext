//
//  HomePage.swift
//  iGotNext
//
//  Created by Michael Wright on 2021-11-18.
//

import SwiftUI
import MapKit
import FirebaseCore
import FirebaseFirestore

//struct Game: Identifiable{
//    let id = UUID()
//    var gameType : String?
//    var startTime : Double?
//    var endTime : Double?
//    var location : CLLocationCoordinate2D?
//}


struct HomePage: View {
    
    @ObservedObject private var gameViewModel = GameViewModel()
    
    @State private var searchVal = ""

    let gradientStart = Color(red: 0.34, green: 0.20, blue: 0.18)
    let gradientEnd = Color(red: 0.14, green: 0.23, blue: 0.28)
    
    
//    @State var listOfGames = [
//        Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)),
//        Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)),
//        Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)),
//        Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)),
//        Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664))
//    ]
    
    
//
//        @State var listOfGames = [
//            Game(gameType: "Dodgeball", startTime : Date(), endTime: Date(), loc: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)),
//            Game(gameType: "Dodgeball", startTime : Date(), endTime: Date(), loc: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664))
//        ]
    
    @State var sportsTags = [
       "Basketball", "Soccer", "Tennis", "Basketball", "Soccer", "Tennis"
    ]
    
    var body: some View {
        
        VStack{
            Text("Find a Game.")
                .font(.system(size: 25, weight: .bold))
                .frame(width: UIScreen.main.bounds.size.width - 40, alignment: .leading)
            
            TextField("Search for a sport", text: $searchVal)
                .padding(20)
                .cornerRadius(20)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<sportsTags.count) { i in
                        Button(action:{
                        }){
                            ZStack{
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: 100, height: 40)
                                    .cornerRadius(10)
                                    .shadow(radius: 3, y: 1)
                                Text(sportsTags[i])
                                   .foregroundColor(Color.white)
                                   .frame(width: 120, alignment: .center)
                            }
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 0))

            
            Text("Reccomended Games")
                .font(.system(size: 16, weight: .bold))
                .frame(width:  UIScreen.main.bounds.size.width - 40, alignment: .leading)
            
            
//            List(gameViewModel.games){ game in
//                Text(game.gameType ?? "")
//            }
            
            //Text(gameViewModel.games[0].gameType ?? "")
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    if(gameViewModel.games.count == 0){
                        Text("Loading...")
                    }
                    else{
                        
                            ForEach(0..<gameViewModel.games.count) { i in
                                
                                //ZStack{
                                NavigationLink(destination: GameInformationView(passedInGame: $gameViewModel.games[i] )){
                                        
                                        ZStack{
                                        Image(gameViewModel.games[i].gameType?.lowercased() ?? "noimage")
                                                 .resizable()
                                                 .scaledToFill()
                                                 .frame(width: UIScreen.main.bounds.size.width - 70, height: 250)
                                                 .cornerRadius(20)
                                        Image("gradient")
                                                 .resizable()
                                                 .scaledToFill()
                                                 .frame(width: UIScreen.main.bounds.size.width - 70, height: 250)
                                                 .cornerRadius(20)
                                                 .opacity(0.45)
                                                 .shadow(color: Color.black, radius: 2)
//                                        Rectangle()
//                                            .fill(LinearGradient(
//                                              gradient: .init(colors: [gradientStart, gradientEnd]),
//                                              startPoint: .init(x: 0.2, y: 0),
//                                              endPoint: .init(x: 0.9, y: 0.8)
//                                            ))
//                                            .frame(width: UIScreen.main.bounds.size.width - 70, height: 250)
//                                            .cornerRadius(20)
//                                            .opacity(0.8)
                                        //Text(listOfGames[i].gameType!)
                                        Text(gameViewModel.games[i].gameType ?? "")
                                           .foregroundColor(Color.white)
                                           .font(.system(size: 25, weight: .bold))
                                           .frame(width:  UIScreen.main.bounds.size.width - 70, height: 250, alignment: .topLeading)
                                           .padding(EdgeInsets(top: 50, leading: 30, bottom: 0, trailing: 0))
                                        }

                                    //}
                                }
                                //.padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 0))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))

                    }
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 20))
                
            }
            
            Text("Discover")
                .font(.system(size: 16, weight: .bold))
                .frame(width:  UIScreen.main.bounds.size.width - 40, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
//                HStack{
//                    ForEach(0..<listOfGames.count) { i in
//                        VStack{
//                            Button(action:{
//                            }){
//                                ZStack{
//                                    Image("basketball")
//                                         .resizable()
//                                         .scaledToFill()
//                                         .frame(width: 120, height: 120)
//                                         .cornerRadius(20)
//                                }
//                            }
//                            Text(listOfGames[i].gameType!)
//                               .font(.system(size: 12, weight: .bold))
//                        }
//                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
//                    }
//                }
//                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            }
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 100, alignment: .top)
        .onAppear(){
            self.gameViewModel.fetchData()
        }

    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
