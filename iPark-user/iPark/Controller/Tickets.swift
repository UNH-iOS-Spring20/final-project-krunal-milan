//
//  Tickets.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/3/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI
import Firebase
import Combine

class Tickets: ObservableObject{
       @Published var adultquantity: Int = 1
    
    @Published var typeoftickets: [String] = ["Single Entry", "Yearly Pass"]
    @Published  var typeofticketselector: Int = 0
    
    
    @Published  var dateofentry:Date = Date()
       @Published var childrenquantity: Int = 0
       @Published var adultprice: Int = 30
       @Published var childrenprice: Int = 20
    @Published var totalqn = 0
    @Published var adulttotal: Int = 0
       @Published var childrentotal: Int = 0
       @Published var grandtotal: Int = 0
    @Published var taxes: Int = 0

    /// Pass Data
    
    @Published var adultpassprice: Int = 100
    @Published var childrenpassprice: Int = 70



   
    
    
    
}







public func createTicket(useremail: String, typeofticket: String, dateofticket: Date, numberoftickets: Int, total: Int){
    let db = Firestore.firestore()
let numberoftickets_str = String(numberoftickets)
let total_str = String(total)
    
let pizzeriasRef = db.collection("Tickets")

    
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    let date = Date().advanced(by: -14400)
     
    // US English Locale (en_US)
    dateFormatter.locale = Locale(identifier: "en_US")
    print(dateFormatter.string(from: date))
    
    
    let dateofpurchase_str = dateFormatter.string(from: date)
    let dateofticket_str = dateFormatter.string(from: dateofticket)
    
pizzeriasRef.document().setData([
    "Useremail":useremail,
    "Typeofticket":typeofticket,
    "Dateofticket": dateofticket_str,
    "Numberoftickets":numberoftickets_str,
    "Amountcharged": total_str,
    "Dateofpurchase": dateofpurchase_str
])

}



public func createPass(amountcharged: Int, useremail: String,
                       validfrom: Date, validupto: Date, typeofticket: String){
    let db = Firestore.firestore()
let amountcharged_str = String(amountcharged)
    
let pizzeriasRef = db.collection("Passes")

    
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    let date = Date().advanced(by: -14400)
     
    // US English Locale (en_US)
    dateFormatter.locale = Locale(identifier: "en_US")
    print(dateFormatter.string(from: date))
    
    
    let validfrom_str = dateFormatter.string(from: validfrom)
    let validupto_str = dateFormatter.string(from: validupto)
    
pizzeriasRef.document().setData([
    "Amountcharged": amountcharged_str,
    "Useremail":useremail,
    "Validfrom": validfrom_str,
    "Validupto": validupto_str,
    "Typeofticket":typeofticket
])

}
