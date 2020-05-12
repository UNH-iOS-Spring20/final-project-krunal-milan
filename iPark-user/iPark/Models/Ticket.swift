//
//  Ticket.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/4/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import FirebaseFirestore

class Ticket: FirebaseCodable {
    var id: String
    @Published var Amountcharged: String
    @Published var Useremail: String
    @Published var Dateofticket: String
    @Published var Numberoftickets: String
    @Published var Typeofticket: String
    @Published var Dateofpurchase: String
    
    var data: [String: Any]{
        return[
            "Amountcharged": Amountcharged,
            "Useremail": Useremail,
            "Dateifticket": Dateofticket,
            "Numberoftickets": Numberoftickets,
            "Typeofticket": Typeofticket,
            "Dateofpurchase": Dateofpurchase
        ]
    }
    
    required init?(id: String, data: [String : Any]){
        guard let Useremail = data["Useremail"] as? String,
                  let Typeofticket = data["Typeofticket"] as? String,
                  let Dateofticket = data["Dateofticket"] as? String,
                  let Numberoftickets = data["Numberoftickets"] as? String,
                  let Amountcharged = data["Amountcharged"] as? String,
                  let Dateofpurchase = data["Dateofpurchase"] as? String
                  else{
                      return nil
              }
      
        self.id = id
        self.Amountcharged =  Amountcharged
        self.Useremail = Useremail
        self.Dateofticket = Dateofticket
        self.Numberoftickets = Numberoftickets
        self.Typeofticket = Typeofticket
        self.Dateofpurchase = Dateofpurchase
    
}
    
    
}



