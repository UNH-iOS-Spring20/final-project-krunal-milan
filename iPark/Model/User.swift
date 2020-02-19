//
//  User.swift
//  iPark
//
//  Created by Krunal Mistry on 2/19/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

class User {
    var Fname: String
    var Lname: String
    
    init?(Fname: String, Lname: String) {
        if Fname.isEmpty || Lname.isEmpty {
            return nil
        }
        self.Fname = Fname
        self.Lname = Lname
    }
}
