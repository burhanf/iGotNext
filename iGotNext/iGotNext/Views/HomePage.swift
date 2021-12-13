//
//  NewHomePage.swift
//  iGotNext
//
//  Created by Michael on 2021-12-04.
//

import SwiftUI
import MapKit
import FirebaseCore
import FirebaseFirestore

struct HomePage: View {
    let viewModel = WatchGameViewModel(connectivityProvider: ConnectionProvider())
    @ObservedObject private var gameViewModel = GameViewModel()
    
    @State private var searchVal = ""

    let gradientStart = Color(red: 0.34, green: 0.20, blue: 0.18)
    let gradientEnd = Color(red: 0.14, green: 0.23, blue: 0.28)
    
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
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    if(gameViewModel.games.count == 0){
                        Text("Loading...")
                    }
                    else{
                            ForEach(0..<gameViewModel.games.count) { i in
                                
                            ZStack{
                                NavigationLink(destination: GameInformationView(passedInGame: $gameViewModel.games[i], viewModel: viewModel)){
                                        
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
                                        VStack{
                                            Text(gameViewModel.games[i].gameType ?? "")
                                               .foregroundColor(Color.white)
                                               .font(.system(size: 25, weight: .bold))
                                               .padding(EdgeInsets(top: 50, leading: 30, bottom: 0, trailing: 0))

                                            HStack{
                                                Image("pin")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                Text("Park Aveneue" ?? "Not Available")
                                                    .foregroundColor(Color.white)
                                            }
                                            HStack{
                                                Image("clock")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                Text("Friday at Noon" ?? "Not Available")
                                                    .foregroundColor(Color.white)
                                            }
                                            HStack{
                                                Image("skillLevel")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                Text(gameViewModel.games[i].skillLevel ?? "Not Available")
                                                    .foregroundColor(Color.white)
                                            }
                                        }
                                        .frame(width:  UIScreen.main.bounds.size.width - 70, height: 250, alignment: .topLeading)

                                    }
                                    //}
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                                //.padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 0))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))

                    }
                    
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 20))

            }
            
            Text("Discover")
                .font(.system(size: 16, weight: .bold))
                .frame(width:  UIScreen.main.bounds.size.width - 40, alignment: .leading)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    if(gameViewModel.games.count == 0){
                        Text("Loading...")
                    }
                    else{
                
                    ForEach(0..<gameViewModel.games.count) { i in
                        VStack{
                            Button(action:{
                            }){
                                ZStack{
                                    Image(gameViewModel.games[i].gameType?.lowercased() ?? "noimage")
                                             .resizable()
                                             .scaledToFill()
                                             .frame(width: 120, height: 120)
                                             .cornerRadius(20)
                                    Image("gradient")
                                             .resizable()
                                             .scaledToFill()
                                             .frame(width: 120, height: 120)
                                             .cornerRadius(20)
                                             .opacity(0.45)
                                             .shadow(color: Color.black, radius: 2)
                                }
                            }
                            Text(gameViewModel.games[i].gameType!)
                               .font(.system(size: 12, weight: .bold))
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    }
                }
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 20))
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
