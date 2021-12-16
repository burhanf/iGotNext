//
//  FriendsView.swift
//  iGotNext
//
//  Created by Amirhossein on 2021-11-21.
//

import SwiftUI
import Firebase

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
        
        var user = db.collection("User").document(userId!).getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
        
    }
}

