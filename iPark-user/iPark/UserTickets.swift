//
//  UserTickets.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/4/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
let query1 = Firestore.firestore().collection("Tickets")
let query4 = Firestore.firestore().collection("Users")
let query5 = Firestore.firestore().collection("Passes")


struct UserTickets: View {
@EnvironmentObject var session: SessionStore

@ObservedObject public var tickets = FirebaseCollection<Ticket>(collectionRef: ticketsCollectionReference)
@ObservedObject public var userdetails = FirebaseCollection<UserDetails>(collectionRef: usersCollectionReference)
@ObservedObject public var passes = FirebaseCollection<Pass>(collectionRef: passCollectionReference)


    var body: some View {
        Group{
            
                ForEach(passes.items){
                    pass in
                    if(pass.Useremail == self.session.email1){
                        Section(header: Text("My Yearly Pass").padding(.vertical, 15)){

                        NavigationLink(destination: UserPassView(pass:pass)){
                            HStack{
                            
                                Text("Vaild from \(pass.Validfrom) to \(pass.Validupto) ")
                                
                            } .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 40)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .bold))
                                .background(LinearGradient(gradient: Gradient(colors:[Color(.black), Color(.black)]), startPoint: .leading, endPoint: .trailing
                                ))
                                .cornerRadius(5).padding(.vertical, 15)
                            
                        }
                    }
                }
                
            }
            Divider()
            
            List{
                Section(header: Text("My Tickets")){
                    ForEach(tickets.items){
                        ticket in
                        if(ticket.Useremail == self.session.email1){
                            
                            
                            NavigationLink(destination: UserTicketView(ticket: ticket)){
                                
                                Text("Your Ticket for \(ticket.Dateofticket)")
                                
                            }.padding(15)
                        }
                    }
                    
                }
                
                
                
            }
        }
        
    }
}
struct UserTickets_Previews: PreviewProvider {
    static var previews: some View {
        UserTickets()
    }
}
