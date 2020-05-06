//
//  SingleTicketView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/2/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI



struct SingleTicketView: View{
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @ObservedObject var ticket = Tickets()
    

   
    

  var body: some View {
        VStack{

        HStack{
            Image("homeimage").resizable().frame(width: 250, height: 150  ).padding(10)
            VStack{
                       Text("Single Entry Ticket").padding(10)
                Spacer()
                    VStack{
                Text("Adult: $\(ticket.adultprice)").font(.system(size:14))
                Text("Children: $\(ticket.childrenprice)").font(.system(size:14))
                    }.padding(.vertical, 10)
            }

                
                   }.padding(0).background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),
                                                                                           lineWidth: 1)).padding(.horizontal, 10).frame(width: 450, height: 170)
            Spacer().frame(height: 30)
        VStack{
           
            Text("Pick A Date")
            DatePicker("", selection: $ticket.dateofentry, displayedComponents: .date).labelsHidden().frame(height: 170).datePickerStyle(DefaultDatePickerStyle())
            Spacer().frame(height: 30)

            VStack{
            Text("Select number of Tickets")
            HStack{
                HStack{
                    Stepper(value: $ticket.adultquantity, in: 0...10, label: { Text("Adult                              \(ticket.adultquantity)")})
                }
            }
                HStack{
                    Stepper(value: $ticket.childrenquantity, in: 0...10, label: { Text("Children                        \(ticket.childrenquantity)")})
                }
                
               
            }.padding(.horizontal, 40)

            
           
            NavigationLink(destination: Summary( adultquantity: ticket.adultquantity,
                                                childrenquantity: ticket.childrenquantity, adultprice: ticket.adultprice,
                                                childrenprice: ticket.childrenprice, typeoftickets: ticket.typeoftickets,
                                                typeofticketselector: ticket.typeofticketselector, dateofentry: ticket.dateofentry))
            {
                           
                                        
                            Text("Proceed to Checkout")
                                .frame(width: 200, height: 40)
                                
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors:[Color(.black), Color(.black)]), startPoint: .leading, endPoint: .trailing
                    )).cornerRadius(5).padding(5)
                    
                            }.padding(5)
            
                            
            Spacer()

        }
           
        }.font(.system(size: 18, weight: . medium)).padding(.horizontal, 10)
    }
}


struct SingleTicketView_Previews: PreviewProvider {
    static var previews: some View {
        SingleTicketView()
    }
}
