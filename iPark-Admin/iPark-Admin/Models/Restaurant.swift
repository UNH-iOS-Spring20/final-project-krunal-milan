//
//  Restaurant.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/26/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import FirebaseFirestore

class  Restaurant: FirebaseCodable {
    var id: String
    @Published var Name: String
    @Published var Location: String
    @Published var Category: String
    @Published var Cuisine: String
    @Published var Phone: String
    
    // declare new property of data which returns dictionary for all of the fields in object
    var data: [String: Any] {
        return [
            "Name" : Name,
            "Location" : Location,
            "Category" : Category,
            "Cuisine" : Cuisine
        ]
    }
    
    required init?(id: String, data: [String : Any]){
        guard let Name = data["Name"] as? String,
            let Location = data["Location"] as? String,
            let Category = data["Category"] as? String,
            let Cuisine = data["Cuisine"] as? String,
            let Phone = data["Phone"] as? String
            
            else{
                return nil
        }
        self.id = id
        self.Name = Name
        self.Location = Location
        self.Category = Category
        self.Cuisine = Cuisine
        self.Phone = Phone
    }
}
