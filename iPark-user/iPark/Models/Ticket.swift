//
//  Ticket.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/4/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import FirebaseFirestore

struct Ticket: Identifiable {
    var id: String
    var Amountcharged: String
    var Useremail: String
    var Dateofticket: String
    var Numberoftickets: String
    var Typeofticket: String
    var Dateofpurchase: String
    
    
    
    
}

extension Ticket: DocumentSerializable{
    init?(id: String, dictionary: [String : Any]){
        guard let Useremail = dictionary["Useremail"] as? String,
            let Typeofticket = dictionary["Typeofticket"] as? String,
            let Dateofticket = dictionary["Dateofticket"] as? String,
            let Numberoftickets = dictionary["Numberoftickets"] as? String,
            let Amountcharged = dictionary["Amountcharged"] as? String,
            let Dateofpurchase = dictionary["Dateofpurchase"] as? String

            
            else{
                return nil
        }
        self.init(id:id, Amountcharged: Amountcharged, Useremail:Useremail, Dateofticket: Dateofticket, Numberoftickets: Numberoftickets,Typeofticket:Typeofticket, Dateofpurchase: Dateofpurchase )
    }
}


