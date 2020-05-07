//
//  UserDetails.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/4/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import FirebaseFirestore

class UserDetails: FirebaseCodable {
    var id: String
    @Published var FirstName: String
    @Published var LastName: String
    @Published var Email: String
    
    var data: [String: Any]{
        return[
            "FirstName": FirstName,
            "LastName": LastName,
            "Email": Email
        ]
    }
    
    required init?(id: String, data: [String : Any]){
        guard let FirstName = data["FirstName"] as? String,
         let LastName = data["LastName"] as? String,
         let Email = data["Email"] as? String
            else{
                return nil
        }
        self.id = id
        self.FirstName = FirstName
        self.LastName = LastName
        self.Email = Email

 
    }
    
}


