//
//  User.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-04.
//This class represents a user that has personal information and is saved to the db, the user signs into the app to view their own datas

import UIKit

class User: NSObject {
    //variables a user will have
    let id = UUID()
    var firstName : String? //first name of a user
    var lastName : String? //last name of a user
    var age : Int? //age name of a user
    var skillLevel : String? //chosen skill level to represent the user
    
    //constructor that will take parameters to create a full user object
    init(firstName : String, lastName : String, age : Int, skill : String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.skillLevel = skill
    
        super.init()
    }
}
