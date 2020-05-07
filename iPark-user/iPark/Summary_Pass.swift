//
//  Summary_Pass.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/5/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct Summary_Pass: View {
    @EnvironmentObject var session: SessionStore
       @ObservedObject var ticket = Tickets()
       @State public var adultquantity: Int
       @State public var childrenquantity: Int
       @State public var adultpassprice: Int
       @State public var childrenpassprice: Int
       @State public var typeoftickets: [String]
       @State public var typeofticketselector: Int
       @State public var dateofentry: Date
       @State public var isBooked: Bool = false
       @State public var useremail: String = ""
    @ObservedObject  var userdetails = FirebaseCollection<UserDetails>(collectionRef: usersCollectionReference)

       static let taskDateFormat: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
       }()
       
       func asWord(adult:Int, child:Int) -> String {
           let value = adult + child
           let numberValue = NSNumber(value: value)
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(from: numberValue)!
      }
       
       
      
       
       var body: some View {
           Group{
           if(isBooked == false){
          
               VStack{
                   Spacer().frame(height: 40)

               VStack{
                   HStack{
                       Text("Type of Ticket:  ").padding(10)
                       Text("\(typeoftickets[1])").padding(10)
                   }
                  
                   HStack{
                       Text("Valid From: ").padding(10)
                       Text("\(Date(), formatter: Self.taskDateFormat)").padding(10)
                   }
                   HStack{
                                         Text("Valid Upto: ").padding(10)
                    Text("\(Date().advanced(by: 31449600), formatter: Self.taskDateFormat)").padding(10)
                                     }
                   }
                  
                   
               VStack{
                  
                   Spacer().frame(height: 40)

                   Text("Summary of Charges")
                   Spacer().frame(height: 40)
                   
                   
                   HStack{
                       Text("Subtotal:                     ")

                       Text("\((childrenquantity * childrenpassprice) + (adultquantity * adultpassprice)) USD")
                   }.padding(20)
                   HStack{
                       Text("Taxes and Fees:            ")

                       Text("\(((adultquantity * adultpassprice) + (childrenpassprice + childrenquantity))*1/10) USD")
                   }.padding(20)
                   HStack{
                       Text("Total:                            ")
                       Text("\(((adultquantity * adultpassprice) + (childrenpassprice + childrenquantity))*11/10) USD")
                   }.padding(20)
                   Spacer().frame(height: 30)

    
                   Button(action:{
                    createPass(amountcharged: self.adultpassprice, useremail: self.session.email1, validfrom: Date(), validupto: Date().advanced(by: 31449600), typeofticket: self.typeoftickets[1])
                                                       
                       self.isBooked = true
                   }){
                       
                     Text("Confirm & Pay")
                            
                           .frame(width: 200, height: 40)
                                       
                           .foregroundColor(.white)
                           .font(.system(size: 14, weight: .bold))
                           .background(LinearGradient(gradient: Gradient(colors:[Color(.black), Color(.black)]), startPoint: .leading, endPoint: .trailing
                           )).cornerRadius(5).padding(5)
                           
                                   }.padding(20)
                   
                   }
           }
               .navigationBarTitle("Review Summary", displayMode: .inline)

           
               
               
               ///------ If Booking is Completed --------///
               
               
           }else{
                   VStack{
                       Text("Your Booking Details").padding(15)
                       Spacer().frame(height: 40)
                       VStack{
                           HStack{
                               Text("\(typeoftickets[1]) Ticket").font(.system(size: 25, weight:. semibold))
                           }.padding(.vertical, 20)
                        
                       
                            HStack{
                                
                                ForEach(userdetails.items){
                                    restaurant in
                                    if(restaurant.Email == self.session.email1){
                                        Text("\(restaurant.FirstName) \(restaurant.LastName)")
                                    }
                                }
                                
                            }.font(Font.custom("Chalkboard", size: 25)).padding(.vertical, 35)
                        
                        
                        HStack{
                            Text("Valid from: ")
                            Text("\(Date(), formatter: Self.taskDateFormat)")
                        }.font(.system(size: 20, weight:. semibold)).padding(15)
                        HStack{
                            Text("Valid upto: ")
                            Text("\(Date().advanced(by: 31449600), formatter: Self.taskDateFormat)")
                        }.font(.system(size: 20, weight:. semibold)).padding(15)
                          
                           Image("barcode").resizable().frame(width: 150, height: 150)
                           Spacer()
                       }.padding(0).frame(width: 300, height:500).background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),lineWidth: 1)).padding(.horizontal, 10)
                       
                       Spacer()
                   }
                   .navigationBarTitle("Booking Completed!")
               }
               
               
           }
       }



}

struct Summary_Pass_Previews: PreviewProvider {
    static var previews: some View {
        Summary_Pass(
                       adultquantity: Tickets().adultquantity,
                       childrenquantity: Tickets().childrenquantity,
                       adultpassprice: Tickets().adultpassprice,
                       childrenpassprice: Tickets().childrenpassprice,
                       typeoftickets: Tickets().typeoftickets,
                       typeofticketselector: Tickets().typeofticketselector,
                       dateofentry: Tickets().dateofentry
               )
    }
}
