//
//  UserDetails.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/4/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import FirebaseFirestore

struct UserDetails: Identifiable {
    var id: String
    var FirstName: String
    var LastName: String
    var Email: String
    
}

extension UserDetails: DocumentSerializable{
    init?(id: String, dictionary: [String : Any]){
        guard let FirstName = dictionary["FirstName"] as? String,
         let LastName = dictionary["LastName"] as? String,
         let Email = dictionary["Email"] as? String
            else{
                return nil
        }
        self.init(id:id, FirstName: FirstName, LastName:LastName, Email:Email )
    }
}
