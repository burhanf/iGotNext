//
//  Signup.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//

import SwiftUI

struct Signup: View {
        @State var username = ""
        @State var password = ""
        var body: some View {
            VStack{
                TextField("Username",text: $username).padding()
                TextField("Password",text: $password).padding()
                Spacer()
            }.padding()
            Button("Signup"){
                print("Signup")
            }
        }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
