//
//  ContentView.swift
//  Authentication
//
//  Created by Milan Chalishajarwala on 5/2/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
   func getUser(){
        session.listen()
    }
    
    var body: some View {
        NavigationView{
        TabView{
            
            Text("Homepage Goes here")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
            }
            TicketsView()
                          .tabItem {
                              Image(systemName: "square.and.pencil")
                              Text("Buy Tickets")
                      }
          
            
            Group{
                if(session.session != nil){
                    VStack{
                        Text("Hello User, You are signed In!")
                        Spacer().frame(height: 180)
                        Section{
                        Button(action: session.signOut){
                            HStack{
                                Image(systemName: "person.crop.circle.fill.badge.minus")
                            Text("Sign Out")                     }.font(.system(size: 18))   .foregroundColor(.red)
                            }
                            
                        }
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
        .navigationBarTitle("iPark", displayMode: .inline)
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
