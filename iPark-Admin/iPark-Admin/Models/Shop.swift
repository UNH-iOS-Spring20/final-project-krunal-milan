//
//  Shop.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/26/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import FirebaseFirestore

class Shop: FirebaseCodable {
    var id: String              //id will not visible to user
    @Published var Name: String
    @Published var Location: String
    @Published var Category: String
    
}

extension Shop: FirebaseCodable{
    init?(id: String, dictionary: [String : Any]){
        guard let Name = dictionary["Name"] as? String,
         let Location = dictionary["Location"] as? String,
         let Category = dictionary["Category"] as? String
    // declare new property of data which returns dictionary for all of the fields in object
    var data: [String: Any] {
        return [
            "Name" : Name,
            "Location" : Location,
            "Category" : Category
        ]
    }
    
    required init?(id: String, data: [String : Any]){
        guard let Name = data["Name"] as? String,
            let Location = data["Location"] as? String,
            let Category = data["Category"] as? String
            else{
                return nil
        }
        self.id = id
        self.Name = Name
        self.Location = Location
        self.Category = Category
    }
    
}





