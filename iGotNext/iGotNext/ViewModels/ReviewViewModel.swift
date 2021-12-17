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
    @Published var userReviews = [Review]()
    
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
    
    func getReviewsByUser(){ //id: String

        db.collection("Review").whereField("user", isEqualTo: "EJ1zfM5i7pXpTv1eSUdxkCSd7G82")
            .getDocuments() { (querySnapshot, err) in
                guard let documents = querySnapshot?.documents else {
                    print("No Documents")
                    return
                }

                self.userReviews = documents.map { (queryDocumentSnapshot) -> Review in
                    let data = queryDocumentSnapshot.data()

                    let reviewContent = data["reviewContent"]  as? String ?? ""

                    let reviews = Review(reviewContent: reviewContent)

                    return reviews
                    }
                }
                
                
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    for document in querySnapshot!.documents {
//                        print("\(document.documentID) => \(document.data())")
//                    }
//                }
        }

    
    
    func addData(reviewContent : String, user : String, rating: String){
        //add a new document to the Game collection
        var referenceOfNewDocument: DocumentReference? = nil
        //Reference: https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/GeoPoint
        referenceOfNewDocument = db.collection("Review").addDocument(data: [
            "reviewContent" : String(reviewContent),
            "user" : String(user),
            "rating" : String(rating)
            
        ]){ err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(referenceOfNewDocument!.documentID)")
            }
            
        }
    }


//        db.collection("Review").whereField("user", isEqualTo: "EJ1zfM5i7pXpTv1eSUdxkCSd7G82").addSnapshotListener { (querySnapshot, err) in
//            guard let documents = querySnapshot?.documents else {
//                print("No Documents")
//                return
//                }
//
//            self.reviews = documents.map { (queryDocumentSnapshot) -> Review in
//                let data = queryDocumentSnapshot.data()
//
//                let reviewContent = data["reviewContent"]  as? String ?? ""
//
//                let review = Review(reviewContent: reviewContent)
//
//                return review
//                }
//            }
//      }
//

}

