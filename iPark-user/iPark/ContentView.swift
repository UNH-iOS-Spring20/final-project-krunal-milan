//
//  ContentView.swift
//  Authentication
//
//  Created by Milan Chalishajarwala on 5/2/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
let query2 = Firestore.firestore().collection("Users")


struct ContentView: View {
    @EnvironmentObject var session: SessionStore
   @ObservedObject public var userdetails = FirebaseCollection<UserDetails>(query: query2)
    

   func getUser(){
        session.listen()
    
    
    }
    
    var body: some View {
        
        
        TabView{
            
            Homepage()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
            }
            NavigationView{
                TicketsView()
                    .navigationBarTitle("Buy Tickets")
            }
            .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Buy Tickets")
            }
            
            
            Group{
                if(session.session != nil){
                    NavigationView{
                        VStack(alignment: .leading){
                            Spacer().frame(height:60)

                            ForEach(userdetails.items){
                                restaurant in
                                if(restaurant.Email == self.session.email1){
                                  
                                        HStack{
                                            Image(systemName: "person.fill")
                                            Text("\(restaurant.FirstName) \(restaurant.LastName)")
                                        }.font(.system(size:25, weight:.semibold))
                                        HStack{
                                            Spacer().frame(width: 30)
                                            Text("\(restaurant.Email)")
                                            
                                        }.font(.system(size:15, weight:.light))
                                  

                                    Spacer().frame(height:70)
                                    
                                   UserTickets()
                                    
                                }
                                
                                
                            }
                            
                            

                       
                    

                    
                        }.padding(.horizontal, 15)
                        .navigationBarItems(trailing: Button(action: {self.session.signOut()}){
                            Text("Logout")
                        })
                    .navigationBarTitle("My Profile")
                    }
                }else{
                    AuthView()
                }
                    
                
            }.onAppear(perform:getUser)
                
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("My Profile")
            }
            
            Text("Homepage Goes here")
                                    .tabItem {
                                        Image(systemName: "info.circle.fill")
                                        Text("iPark Info")
                                }

            }
        }
        
        
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
