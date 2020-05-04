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
    
    @Published var typeoftickets = ["Single Entry", "Yearly Pass"]
    @Published  var typeofticketselector = 0
    
    
    @Published  var dateofentry:Date = Date()
       @Published var childrenquantity: Int = 0
       @Published var adultprice: Int = 30
       @Published var childrenprice: Int = 20
    @Published var totalqn = 0
    @Published var adulttotal: Int = 0
       @Published var childrentotal: Int = 0
       @Published var grandtotal: Int = 0
    @Published var taxes: Int = 0




}

public func createTicket(typeofticket: String, dateofticket: Date, numberoftickets: Int, total: Int){
    let db = Firestore.firestore()

let pizzeriasRef = db.collection("tickets")

pizzeriasRef.document().setData([
    "typeofticket":typeofticket,
    "dateofentry":dateofticket,
    "numberoftickets":numberoftickets,
    "amountcharged": total,
    "dateofpurchase": Date().advanced(by: 14400)
])

}
