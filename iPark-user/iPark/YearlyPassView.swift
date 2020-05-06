//
//  YearlyPassView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/2/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI



struct YearlyPassView: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject public var passes = FirebaseCollection<Pass>(query: query5)


  

    var dateFormatter: DateFormatter {
          let formatter = DateFormatter()
          formatter.dateStyle = .long
          return formatter
      }
      @ObservedObject var ticket = Tickets()
      

     @ObservedObject private var userdetails = FirebaseCollection<UserDetails>(query: query2)

      

    var body: some View {
          VStack{

         
              
              VStack{
                Text("Yearly Pass").font(.system(size:25 ,weight: .semibold)).padding(20)
                Text("Valid for 1 Year and Unlimited Entries").font(.system(size:20 ,weight: .semibold)).padding(20)

                
                      VStack{
                        Text("Per Person: $\(ticket.adultpassprice)").font(.system(size:14))
                 
                      }.padding(.vertical, 10)
              }.padding(0).background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),
                                                                                             lineWidth: 1)).padding(.horizontal, 10).frame(width: 450, height: 170)
              Spacer().frame(height: 30)
          VStack{
             
             
              Spacer().frame(height: 30)

    
            ForEach(userdetails.items){
                                           restaurant in
                                           if(restaurant.Email == self.session.email1){
               
            VStack{
                HStack{
                Text("Email: ").padding(5)

            Text("\(restaurant.Email)").padding(10)
                }.padding(.horizontal, 20)
                HStack{
            Text("Name: ").padding(5)
              
              Text("\(restaurant.FirstName) \(restaurant.LastName)").padding(10)
                }
            } .font(.system(size: 18)).padding(.horizontal, 20)
                       
.padding(.horizontal, 40)
            }
            
                }
                               

          
            
              NavigationLink(destination: Summary_Pass( adultquantity: ticket.adultquantity,
                                                   childrenquantity: ticket.childrenquantity, adultpassprice: ticket.adultpassprice,
                                                   childrenpassprice: ticket.childrenpassprice, typeoftickets: ticket.typeoftickets,
                                                  typeofticketselector: ticket.typeofticketselector, dateofentry: Date())){
                             
                                          
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

struct YearlyPassView_Previews: PreviewProvider {
    static var previews: some View {
        YearlyPassView()
    }
}
