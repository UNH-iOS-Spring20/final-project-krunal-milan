//
//  UserTicketView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/5/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct UserTicketView: View {
    func asWord(number: String) -> String {
           let value = (number as NSString).integerValue
           let numberValue = NSNumber(value: value)
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(from: numberValue)!
      }
       
       
    @ObservedObject var ticket:Ticket
    var body: some View {
        Group{
        VStack{
            HStack{
                Text("\(ticket.Typeofticket) Ticket").font(.system(size: 25, weight:. semibold)).padding(15)
            }
            VStack{
                Text("Date of Entry:")
                Text("\(ticket.Dateofticket)")
                //Text("\("Hello", formatter: Self.taskDateFormat)")
            }.font(.system(size: 20, weight:. semibold)).padding(20)
            HStack{
                Text("ADMIT")

                Text("\(asWord(number:ticket.Numberoftickets).uppercased())")
                
            }.font(Font.custom("Chalkboard", size: 25)).padding(.vertical, 40)
            Image("barcode").resizable().frame(width: 150, height: 150)
            Spacer()
        }.padding(0).frame(width: 350, height:500).background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),lineWidth: 1)).padding(.horizontal, 10)
            }
    }
}

struct UserTicketView_Previews: PreviewProvider {
    static var previews: some View {
        UserTicketView(ticket:Ticket(id:"1", data:[ "Amountcharged":"10", "Useremail":"milan@milan.com", "Dateofticket": "Dateofticket", "Numberoftickets":"5", "Typeofticket":"Single", "Dateofpurchase":"Dateofpurchase"])!)
    }
}
