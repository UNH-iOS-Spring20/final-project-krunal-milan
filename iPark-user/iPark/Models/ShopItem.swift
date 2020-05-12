//
//  ShopItem.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import Foundation

class ShopItem: FirebaseCodable {
    var id: String
    @Published var Name: String
    @Published var Price: String
    
    
    var data: [String: Any]{
        return[
            "Name": Name,
            "Price": Price
        
        ]
    
}
    
    required init?(id: String, data: [String : Any]){
    guard let Name = data["Name"] as? String,
     let Price = data["Price"] as? String
        else{
            return nil
    }

        
        self.id = id
        self.Name = Name
        self.Price = Price
        
}

}
