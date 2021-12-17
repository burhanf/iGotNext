//
//  UserProfile.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//This view is responsible for displaying the logged in user's information


import SwiftUI
import Firebase

struct UserProfile: View {
    //auth object for the signed in user
    var userId = Auth.auth().currentUser?.uid
    //firebase database
    private let db = Firestore.firestore()
    
    //state vars that will store the user information and display on screen
    @State var firstName = "Default"
    @State var lastName = "Default"
    @State var skill = "Default"
    @State var age = 99
    
    //instance of viewmodel
    @ObservedObject private var userViewModel = UserViewModel()
    
    
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.10)
        
        VStack{
            Image("user")
                .resizable()
                .clipShape(Circle())
                .frame(width: 200, height: 200, alignment: .center)
                .padding(10)
            if(firstName == "Default"){
                Text("Loading...").onAppear(){
                }
            }
            else{
                Text("\(firstName ?? "No first name") \(lastName ?? "No last name")")
                .font(.headline)
                .bold()
                    .padding(20)
            Text("\(age ?? 0) years old")
                .font(.subheadline)
                .padding(5)
            Text("Skill level: \(skill ?? "Beginner")")
                .font(.subheadline)
                .foregroundColor(.red)
                .padding(5)
            }
            }
        .onAppear(){
            fetchData()
        }
        }
    }
    
    //function that makes a request to the db to get the logged in user and assigns the detail to state vars
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
