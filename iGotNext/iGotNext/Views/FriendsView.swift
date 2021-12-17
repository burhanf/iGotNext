//
//  FriendsView.swift
//  iGotNext
//
//  Created by Amirhossein on 2021-11-21.
//

import SwiftUI
import Firebase


// Friends View Struct
struct FriendsView: View {
    
    // state var to hold friends it was supposed to hold an array of friends but due to the weirdest issues with firestore that I can show you if you're interested our User table decided to completely break down for some reason and only return a part of the document.
    @State var bestFriend = "Amir"
    // captures uid of logged in user
    var userId = Auth.auth().currentUser?.uid
    private let db = Firestore.firestore()
    
    // body of the view
    var body: some View {
        Text("Best Friend: \(bestFriend)").font(.headline)
            .bold()
                .padding(20).onAppear{
            fetchData()
        }
    }
    
    
    // fetch data function that captures user's best friend, again it was supposed to be a list of friends, it's already in the db it's just not working for some reason, you can put a break point on ln 36 and see the contents of datadescription the object should straight up have a friends array what is happening? God knows!
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

