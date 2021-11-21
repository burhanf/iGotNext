//
//  HomePage.swift
//  iGotNext
//
//  Created by Michael Wright on 2021-11-18.
//

import SwiftUI
import MapKit

struct Game: Identifiable{
    let id = UUID()
    var gameType : String?
    var startTime : Double?
    var endTime : Double?
    var location : CLLocationCoordinate2D?
}

struct HomePage: View {
    
    @State private var searchVal = ""

    @State var listOfGames = [
        Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)),
        Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)),
        Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)),
        Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664)),
        Game(gameType: "Basketball", startTime : 1.50, endTime: 1.60, location: CLLocationCoordinate2D(latitude: 40.748440, longitude: -73.985664))
    ]
    
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
                    ForEach(0..<listOfGames.count) { i in
                        Button(action:{
                        }){
                            ZStack{
                                Image("basketball")
                                     .resizable()
                                     .scaledToFill()
                                     .frame(width: UIScreen.main.bounds.size.width - 70, height: 250)
                                     .cornerRadius(20)
                                Text(listOfGames[i].gameType!)
                                   .foregroundColor(Color.white)
                                   .font(.system(size: 25, weight: .bold))
                                    .frame(width:  UIScreen.main.bounds.size.width - 70, alignment: .leading)
                                    
                            }
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 0))
                        }
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                
            }
            
            Text("Discover")
                .font(.system(size: 16, weight: .bold))
                .frame(width:  UIScreen.main.bounds.size.width - 40, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<listOfGames.count) { i in
                        VStack{
                            Button(action:{
                            }){
                                ZStack{
                                    Image("basketball")
                                         .resizable()
                                         .scaledToFill()
                                         .frame(width: 120, height: 120)
                                         .cornerRadius(20)
                                }
                            }
                            Text(listOfGames[i].gameType!)
                               .font(.system(size: 12, weight: .bold))
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            }
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 100, alignment: .top)

    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
