//
//  UserProfile.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//This view is responsible for displaying the logged in user's information

//TODO:get logged in user, gets the first user in db for now


import SwiftUI

struct UserProfile: View {
    var sampleUser = User(firstName: "Burhan", lastName: "Faquiri", age: 21, skill: "Beginner")
    
    //instance of viewmodel
    @ObservedObject private var userViewModel = UserViewModel()
    
    
    var body: some View {
        VStack{
            if(userViewModel.users.count == 0){
                Text("Loading...")
            }
            else{
            Image("basketball")
                .resizable()
                .clipShape(Circle())
                .frame(width: 150, height: 150, alignment: .center)
            
            Text("\(userViewModel.users[0].firstName ?? "No first name") \(userViewModel.users[0].lastName ?? "No last name")")
                .font(.headline)
                .bold()
            Text("\(userViewModel.users[0].age ?? 0) years old")
                .font(.subheadline)
            Text("Skill level: \(userViewModel.users[0].skillLevel ?? "Beginner")")
                .font(.subheadline)
                .foregroundColor(.yellow)
            }
        }
        .onAppear(){
            self.userViewModel.fetchData()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
