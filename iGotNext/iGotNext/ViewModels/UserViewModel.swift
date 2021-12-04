//
//  UserViewModel.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-04.
//


import UIKit
import MapKit
import Firebase
//Reference: https://www.youtube.com/watch?v=f6u3AnOKZd0
class UserViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    private let db = Firebase.Firestore.firestore()
    
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
    func createAccount(email: String, password: String,age: Int, firstName: String, lastName: String, skillLevel: String){
        //validations
        var user = Auth.auth().createUser(withEmail: email, password: password){ (result:AuthDataResult?, error:Error?) in
            if((error == nil)){
            self.db.collection("User").document((result?.user.uid)!).setData([
                "firstName":firstName,
                "lastName":lastName,
                "skillLevel":skillLevel,
                "age": age
            ])
        }
        }
    }
    //Reference: https://firebase.google.com/docs/firestore/query-data/get-data
    func getUserById(idToSearch: String){
        let docRef = db.collection("User").document(idToSearch)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
    
}
