//
//  User.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 4/28/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import FirebaseFirestore

class User {
    var uid: String
    var displayName: String?
    var email: String?
    
    
    init(uid: String, displayName:String?, email:String?){
        self.uid = uid
        self.displayName = displayName
        self.email = email
    }
}
