//
//  ReviewViewModel.swift
//  iGotNext
//
//  Created by Michael on 2021-12-04.
//


import UIKit
import MapKit
import FirebaseFirestore


//reference: https://www.youtube.com/watch?v=f6u3AnOKZd0
class ReviewViewModel: ObservableObject {

    @Published var reviews = [Review]()
    
    private let db = Firestore.firestore()

    func fetchData(){
        db.collection("Review").addSnapshotListener { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
                }
            
            self.reviews = documents.map { (queryDocumentSnapshot) -> Review in
                let data = queryDocumentSnapshot.data()
                
                let reviewContent = data["reviewContent"]  as? String ?? ""
                
                let review = Review(reviewContent: reviewContent)
                
                return review
                }
            }
        }
    
}

