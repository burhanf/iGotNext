//
//  FriendsView.swift
//  iGotNext
//
//  Created by Amirhossein on 2021-11-21.
//

import SwiftUI
import Firebase


struct FriendsView: View {
    @State var bestFriend = "Amir"
    var userId = Auth.auth().currentUser?.uid
    private let db = Firestore.firestore()
    
    var body: some View {
        Text("Best Friend: \(bestFriend)").font(.headline)
            .bold()
                .padding(20).onAppear{
            fetchData()
        }
    }
    
    func fetchData(){
        let docRef = db.collection("User").document(userId!)
        
        docRef.getDocument(source: .cache) { (document, error) in
          if let document = document {
            let dataDescription = document.data()
            bestFriend = dataDescription?["bestie"] as! String ?? "Amir"
            
            
          } else {
            print("Document does not exist in cache")
          }
        }
    }
}

