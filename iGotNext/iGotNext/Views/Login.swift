//
//  Login.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//

//passes the signed in user to user profile

import SwiftUI
import Firebase
struct Login: View {
    
    //make object of user from signed in information
    @State var email = ""
    @State var password = ""
    @State var navigate = false
    let auth = Auth.auth()
    var body: some View {
        NavigationView{
            VStack{
                TextField("Email",text: $email).autocapitalization(.none).padding()
                SecureField("Password",text: $password).padding()
                Spacer()
                NavigationLink(destination: HomePage(), isActive: $navigate){
                    Button("Sign in"){
                        signIn(email: email, password: password)
                    }
                }
            }.padding()
        }
    }
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email,password: password) { result, error in
            guard result != nil, error == nil else{
                navigate = false
                return
            }
            navigate = true
        }
    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
