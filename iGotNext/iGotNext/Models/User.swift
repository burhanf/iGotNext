//
//  User.swift
//  iGotNext
//
//  Created by Burhan Faquiri on 2021-12-04.
//

import UIKit

class User: NSObject {
        let id = UUID()
        var firstName : String?
        var lastName : String?
        var age : Int?
        var skillLevel : String?
    
    //needs a list of games played for history
    
    //ctor
    init(firstName : String, lastName : String, age : Int, skill : String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.skillLevel = skill
    
        super.init()
    }
}
