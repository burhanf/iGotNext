//
//  HistoryView.swift
//  iGotNext
//
//  Created by Amirhossein on 2021-11-21.
//

import SwiftUI
import Firebase
struct HistoryView: View {
    var userId = Auth.auth().currentUser?.uid
    private let db = Firestore.firestore()
    @State var games: [Dictionary<String, String>] = []
    
    // Struct for each game history row
    struct HistoryRow: View {
        var game: Dictionary<String, String>
        var body: some View {
            VStack {
                Text("Game Type: \(game["GameType"] ?? "")").font(.headline)
                    .bold()
                        .padding(20)
                Text("Skill Level: \(game["SkillLevel"] ?? "")").font(.headline)
                    .bold()
                        .padding(20)
                Text("Max: \(game["MaxPlayers"] ?? "")").font(.headline)
                    .bold()
                        .padding(20)
                Image(game["GameType"]?.lowercased() ?? "")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding(10)
            }
        }
    }

    // body of struct
    var body: some View {
        List(games, id: \.self) { game in
            HistoryRow(game: game)
        }.onAppear {
            fetchData()
        }
    }
    
    //fetch data function to capture history documents
    
    func fetchData() {
        games.removeAll()
        db.collection("Game").whereField("Creator", isEqualTo: userId!).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var index = 0
                for document in querySnapshot!.documents {
                    let dData = document.data()
                    var dict: Dictionary<String, String> = [:]
                    for (key, value) in dData {
                        dict[key] = value as? String
                    }
                    games.append(dict)
                    index += 1
                }
            }
    }
        
    }
}


