//
//  UserProfile.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//This view is responsible for displaying the logged in user's information

//TODO:get logged in user, gets the first user in db for now


import SwiftUI
import Firebase

struct UserProfile: View {
    var userId = Auth.auth().currentUser?.uid
    private let db = Firestore.firestore()
    
//    @State var loggedInUser = User(firstName: "Default", lastName: "Default", age: 99, skill: "Default")
    @State var firstName = "Default"
    @State var lastName = "Default"
    @State var skill = "Default"
    @State var age = 99
    
    //instance of viewmodel
    @ObservedObject private var userViewModel = UserViewModel()
    
    
    var body: some View {
        VStack{
            Image("basketball")
                .resizable()
                .clipShape(Circle())
                .frame(width: 150, height: 150, alignment: .center)
            if(firstName == "Default"){
                Text("Loading...").onAppear(){
                }
            }
            else{
                Text("\(firstName ?? "No first name") \(lastName ?? "No last name")")
                .font(.headline)
                .bold()
            Text("\(age ?? 0) years old")
                .font(.subheadline)
            Text("Skill level: \(skill ?? "Beginner")")
                .font(.subheadline)
                .foregroundColor(.yellow)
            }
            }
        .onAppear(){
            fetchData()
        }
    }
    
    func fetchData(){
        //Reference: https://firebase.google.com/docs/firestore/query-data/get-data
            let docRef = db.collection("User").document(userId!)
            
            docRef.getDocument(source: .cache) { (document, error) in
              if let document = document {
                let dataDescription = document.data()
                print(dataDescription?["firstName"] as! String)
                
                firstName = dataDescription?["firstName"] as! String
                lastName = dataDescription?["lastName"] as! String
                skill = dataDescription?["skillLevel"] as! String
                age = dataDescription?["age"] as! Int
                
              } else {
                print("Document does not exist in cache")
              }
            }
            
        }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
