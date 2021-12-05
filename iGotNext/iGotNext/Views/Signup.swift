//
//  Signup.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//




import SwiftUI

struct Signup: View {
    
    @State var email = ""
    @State var password = ""
    
    @State var age = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var confirmPassword = ""
    @State var skillLevel = "Beginner"
    var userViewModel = UserViewModel()
    @State var navigate = false
    var body: some View {
        NavigationView{
            VStack{
                TextField("Email",text: $email).autocapitalization(.none).padding()
                SecureField("Password",text: $password).textContentType(.password).padding()
                SecureField("Confirm Password",text: $confirmPassword).textContentType(.password).padding()
                TextField("First Name",text:$firstName).padding()
                TextField("First Name",text:$lastName).padding()
                TextField("Age",text: $age).keyboardType(.numberPad).padding()
                Picker("Skill Level", selection: $skillLevel){
                    Text("Beginner").tag("Beginner")
                    Text("Advanced").tag("Advanced")
                    Text("Intermediate").tag("Intermediate")
                }
                .pickerStyle(SegmentedPickerStyle())

                Spacer()
                NavigationLink(destination: HomePage(), isActive: $navigate){
                    Button("Signup"){
                        userViewModel.createAccount(email: email, password: password, age: Int(age)!, firstName: firstName, lastName: lastName, skillLevel: skillLevel)
                        navigate = userViewModel.isSignedIn
                    }
                }
            }.padding()
        }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
