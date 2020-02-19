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
    var Phone: [Int]
    
    init?(Fname: String, Lname: String, Phone: [Int]) {
        if Fname.isEmpty || Lname.isEmpty || Phone.count != 10 {
            return nil
        }
        self.Fname = Fname
        self.Lname = Lname
        self.Phone = []
    }
}
