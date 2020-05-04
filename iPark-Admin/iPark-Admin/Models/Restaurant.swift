//
//  Restaurant.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/26/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import FirebaseFirestore

struct Restaurant: Identifiable {
    var id: String
  var Name: String
    var Location: String
    var Category: String
    var Cuisine: String
    var Phone: String
 }

extension Restaurant: FirebaseCodable{
    init?(id: String, dictionary: [String : Any]){
        guard let Name = dictionary["Name"] as? String,
         let Location = dictionary["Location"] as? String,
         let Category = dictionary["Category"] as? String,
            let Cuisine = dictionary["Cuisine"] as? String,

        let Phone = dictionary["Phone"] as? String

            else{
                return nil
        }
        self.init(id:id, Name: Name, Location:Location, Category:Category, Cuisine:Cuisine, Phone:Phone )
    }
}
