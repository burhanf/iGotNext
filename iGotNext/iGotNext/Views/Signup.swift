//
//  Signup.swift
//  iGotNext
//
//  Created by ofir david on 2021-11-13.
//




import SwiftUI
import Firebase
struct Signup: View {
    
    @State var email = ""
    @State var password = ""
    // accept user credentials
    var auth = Auth.auth()
    private let db = Firebase.Firestore.firestore()
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
                // create inputs to receive the data from the user
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
                        createAccount(email: email, password: password, age: Int(age)!, firstName: firstName, lastName: lastName, skillLevel: skillLevel)
                    }
                }
            }.padding()
        }
    }
    func createAccount(email: String, password: String,age: Int, firstName: String, lastName: String, skillLevel: String){
        //validations
        // upon creation, login to the newly created user and navigate to the homepage
        var user = try Auth.auth().createUser(withEmail: email, password: password){ result, error in
            guard result != nil, error == nil else{
                navigate = false
                return
            }
            self.db.collection("User").document((result?.user.uid)!).setData([
                "firstName":firstName,
                "lastName":lastName,
                "skillLevel":skillLevel,
                "age": age
            ])
            navigate = true
        }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
