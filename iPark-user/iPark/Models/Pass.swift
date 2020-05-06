//
//  Pass.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/5/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import FirebaseFirestore

struct Pass: Identifiable {
    var id: String
    var Amountcharged: String
    var Useremail: String
    var Validfrom: String
    var Validupto: String
    var Typeofticket: String
    
    
    
    
}

extension Pass: DocumentSerializable{
    init?(id: String, dictionary: [String : Any]){
        guard let Amountcharged = dictionary["Amountcharged"] as? String,
            let Useremail = dictionary["Useremail"] as? String,
        let Validfrom = dictionary["Validfrom"] as? String,
        let Validupto = dictionary["Validupto"] as? String,
        let Typeofticket = dictionary["Typeofticket"] as? String

            
            
            else{
                return nil
        }
        self.init(id:id, Amountcharged: Amountcharged, Useremail:Useremail, Validfrom:Validfrom, Validupto: Validupto, Typeofticket: Typeofticket )
    }
}


