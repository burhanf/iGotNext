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
    
    struct HistoryRow: View {
        var game: Dictionary<String, String>
        var body: some View {
            VStack {
                Text("Game Type: \(game["GameType"] ?? "")")
                Text("Skill Level: \(game["SkillLevel"] ?? "")")
                Text("Max: \(game["MaxPlayers"] ?? "")")
                Image(game["GameType"]?.lowercased() ?? "")
            }
        }
    }

    
    var body: some View {
        List(games, id: \.self) { game in
            HistoryRow(game: game)
        }.onAppear {
            fetchData()
        }
    }
    
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


