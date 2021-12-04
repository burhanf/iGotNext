//
//  Login.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//

//passes the signed in user to user profile

import SwiftUI

struct Login: View {
    
    //make object of user from signed in information
    @State var username = ""
    @State var password = ""
    var body: some View {
        VStack{
            TextField("Username",text: $username).padding()
            TextField("Password",text: $password).padding()
            Spacer()
        }.padding()
        Button("Login"){
            print("Login")
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
