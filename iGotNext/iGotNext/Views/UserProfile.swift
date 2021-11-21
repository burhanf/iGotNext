//
//  UserProfile.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-11-18.
//

import SwiftUI

struct User: Identifiable{
    let id = UUID()
    var firstName : String?
    var lastName : String?
    var age : Int?
    var avgRating : Double?
}

struct UserProfile: View {
    
    private var sampleUser = User(firstName: "Burhan", lastName: "Faquiri", age: 21, avgRating: 5.00)
    
    
    var body: some View {
        VStack{
            Image("basketball")
                .resizable()
                .clipShape(Circle())
                .frame(width: 150, height: 150, alignment: .center)
            
            Text("\(sampleUser.firstName ?? "No first name") \(sampleUser.lastName ?? "No last name")")
                .font(.headline)
                .bold()
            Text("\(sampleUser.age ?? 0) years old")
                .font(.subheadline)
            Text("Average rating: \(sampleUser.avgRating ?? 0.0)")
                .font(.subheadline)
                .foregroundColor(.yellow)
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
