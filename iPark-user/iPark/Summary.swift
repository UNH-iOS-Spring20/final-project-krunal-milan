//
//  Summary.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/3/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct Summary: View {
    @ObservedObject var ticket = Tickets()
    @State public var adultquantity: Int
    @State public var childrenquantity: Int
    @State public var adultprice: Int
    @State public var childrenprice: Int
    @State public var typeoftickets: [String]
    @State public var typeofticketselector: Int
    @State public var dateofentry: Date
    @State public var isBooked: Bool = false

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
        NavigationView{
            VStack{
                Spacer().frame(height: 40)

            VStack{
                HStack{
                    Text("Type of Ticket: ").padding(10)
                    Text("\(typeoftickets[typeofticketselector])").padding(10)
                }
                HStack{
                    Text("Number of Tickets: \(adultquantity + childrenquantity)").padding(1)
                    
                    Text("( Adult: \(adultquantity)").padding(10)
                   
                    Text("Children: \(childrenquantity) )").padding(1)
                   
                    
                }
                HStack{
                    Text("Date of Entry: ").padding(10)
                    Text("\(dateofentry, formatter: Self.taskDateFormat)").padding(10)
                }
                
            }
            Spacer().frame(height:80)
            
            VStack{
               
                Spacer().frame(height: 40)

                Text("Summary of Charges")
                Spacer().frame(height: 40)
                
                
                HStack{
                    Text("Subtotal:                     ")

                    Text("\((childrenquantity * childrenprice) + (adultquantity * adultprice)) USD")
                }.padding(20)
                HStack{
                    Text("Taxes and Fees:            ")

                    Text("\(((adultquantity * adultprice) + (childrenprice + childrenquantity))*1/10) USD")
                }.padding(20)
                HStack{
                    Text("Total:                            ")
                    Text("\(((adultquantity * adultprice) + (childrenprice + childrenquantity))*11/10) USD")
                }.padding(20)
                Spacer().frame(height: 30)

 
                Button(action:{
                    createTicket(
                        typeofticket: self.typeoftickets[self.typeofticketselector],
                        dateofticket: self.dateofentry,
                        numberoftickets:self.adultquantity + self.childrenquantity ,
                        total:(((self.adultquantity * self.adultprice) + (self.childrenprice + self.childrenquantity))*11/10)
                    )
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

        }
            
            
            ///------ If Booking is Completed --------///
            
            
        }else{
            NavigationView{
                VStack{
                    Text("Your Booking Details").padding(15)
                    Spacer().frame(height: 40)
                    VStack{
                        HStack{
                            Text("\(typeoftickets[typeofticketselector]) Ticket").font(.system(size: 25, weight:. semibold)).padding(15)
                        }
                        HStack{
                            Text("Date of Entry: ")
                            Text("\(dateofentry, formatter: Self.taskDateFormat)")
                        }.font(.system(size: 20, weight:. semibold)).padding(15)
                        HStack{
                            Text("ADMIT")

                            Text("\(asWord(adult: adultquantity, child: childrenquantity).uppercased())")
                            
                        }.font(Font.custom("Chalkboard", size: 25)).padding(.vertical, 35)
                        Image("barcode").resizable().frame(width: 150, height: 150)
                        Spacer()
                    }.padding(0).frame(width: 300, height:400).background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),lineWidth: 1)).padding(.horizontal, 10)
                    
                    Spacer()
                }
                .navigationBarTitle("Booking Completed!")
            }
            }
            
        }
    }



}

struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Summary(
                adultquantity: Tickets().adultquantity,
                childrenquantity: Tickets().childrenquantity,
                adultprice: Tickets().adultprice,
                childrenprice: Tickets().childrenprice,
                typeoftickets: Tickets().typeoftickets,
                typeofticketselector: Tickets().typeofticketselector,
                dateofentry: Tickets().dateofentry
        )
    }
}
