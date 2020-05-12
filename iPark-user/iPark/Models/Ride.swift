//
//  Ride.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/26/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import FirebaseFirestore

class Ride: FirebaseCodable {
    var id: String
    @Published var Name: String
    @Published var Location: String
    @Published var Price: String
    @Published var Age_Group: String
    @Published var Photo: String
    
    var data:[String: Any]{
        return[
            "Name": Name,
            "Location": Location,
            "Price": Price,
            "Age_Group":Age_Group,
            "Photo":Photo
            
        ]
        
        
    }
    
    required init?(id: String, data: [String : Any]){
        guard let Name = data["Name"] as? String,
            let Location = data["Location"] as? String,
            let Price = data["Price"] as? String,
            let Age_Group = data["Age_Group"] as? String,
            let Photo = data["Photo"] as? String
            else{
                return nil
        }
        
        
        self.id = id
        self.Name = Name
        self.Location = Location
        self.Price = Price
        self.Age_Group = Age_Group
        self.Photo = Photo
        
    }
}
