//
//  User.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 4/28/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import FirebaseFirestore

struct User: Identifiable {
    var id: String
    var FirstName: String
    var LastName: String
    var Email: String
}
