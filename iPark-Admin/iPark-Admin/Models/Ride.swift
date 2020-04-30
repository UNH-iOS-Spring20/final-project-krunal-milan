//
//  Ride.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/26/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import FirebaseFirestore

struct Ride: Identifiable {
    var id: String
    var Name: String
    var Location: String
    var Price: String
    var Age_Group: String
}
