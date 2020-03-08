//
//  User.swift
//  iPark
//
//  Created by Krunal Mistry on 2/19/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

class User {
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    
    init?(firstName:String, lastName: String, email: String, phone: String) {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
            return nil
        }
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        
    }
}
