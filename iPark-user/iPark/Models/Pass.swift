//
//  Pass.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/5/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import FirebaseFirestore

class Pass: FirebaseCodable {
    var id: String
    @Published var Amountcharged: String
    @Published var Useremail: String
    @Published var Validfrom: String
    @Published var Validupto: String
    @Published var Typeofticket: String
    
    var data:[String: Any]{
        return[
            "Amountcharged": Amountcharged,
        "Useremail": Useremail,
        "Validfrom": Validfrom,
        "Validupto": Validupto,
        "Typeofticket": Typeofticket
        ]
    }
    
    required init?(id: String, data: [String : Any]){
           guard let Amountcharged = data["Amountcharged"] as? String,
               let Useremail = data["Useremail"] as? String,
           let Validfrom = data["Validfrom"] as? String,
           let Validupto = data["Validupto"] as? String,
           let Typeofticket = data["Typeofticket"] as? String

               
               
               else{
                   return nil
           }
   
        self.id = id
        self.Amountcharged = Amountcharged
        self.Useremail = Useremail
        self.Validfrom = Validfrom
        self.Validupto = Validupto
        self.Typeofticket = Typeofticket
    }
}



