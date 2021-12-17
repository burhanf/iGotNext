//
//  UserViewModel.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-04.
//The purpose of this class is to connect to Firebase and retrieve a user from the database
//


import UIKit
import MapKit
import Firebase
//Reference: https://www.youtube.com/watch?v=f6u3AnOKZd0
class UserViewModel: ObservableObject {
    //auth object to get the logged in user
    let auth = Auth.auth()
    //list of users in db
    @Published var users = [User]()
    //boolean checks to see if sign up was successfull or not
    @Published var signupSuccessful = false
    @Published var signinSuccessful = false
    @Published var signedIn = false
    
    //firebase database itself
    private let db = Firebase.Firestore.firestore()
    var isSignedIn: Bool {
        return signedIn
    }
    //function that connects to firebase api and makes a query to get the users
    func fetchData(){
        
        db.collection("User").addSnapshotListener { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                
                //map each firestore attribute
                let userAge = data["age"]  as! Int
                let userFirstName = data["firstName"]  as? String ?? ""
                let userLastName = data["lastName"]  as? String ?? ""
                let userSkillLevel = data["skillLevel"]  as? String ?? ""
                //create a user object from the attributes retrieved in firestore
                let fsUser = User(firstName: userFirstName, lastName: userLastName, age: userAge, skill: userSkillLevel)
                
                print(self.users.count)
                
                return fsUser
            }
        }
    }
}
