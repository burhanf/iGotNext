//
//  FriendsView.swift
//  iGotNext
//
//  Created by Amirhossein on 2021-11-21.
//

import SwiftUI
import Firebase

struct UserDto {
    var firstName: String
}

struct FriendsView: View {
    var userId = Auth.auth().currentUser?.uid
    private let db = Firestore.firestore()
    
    var body: some View {
        List {
            
        }.onAppear{
            fetchData()
        }
    }
    
    func fetchData(){
        
        let docRef = db.collection("User").document(userId!)
        
        docRef.getDocument(source: .cache) { (document, error) in
          if let document = document {
            document.data()
          } else {
            print("Document does not exist in cache")
          }
        }
        
    }
}

