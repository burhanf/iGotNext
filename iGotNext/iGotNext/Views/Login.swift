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
    @State var email = ""
    @State var password = ""
    @State var navigate = false
    var userViewModel = UserViewModel()
    var body: some View {
        NavigationView{
            VStack{
                TextField("Email",text: $email).autocapitalization(.none).padding()
                SecureField("Password",text: $password).padding()
                Spacer()
                NavigationLink(destination: HomePage(), isActive: $navigate){
                    Button("Sign in"){
                        userViewModel.signIn(email: email , password: password)
                        if(userViewModel.isSignedIn){
                            navigate = true
                        }
                    }
                }
            }.padding()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
