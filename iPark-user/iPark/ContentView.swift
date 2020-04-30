//
//  ContentView.swift
//  iPark
//
//  Created by Krunal Mistry on 2/19/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//


import SwiftUI
import FirebaseFirestore

let db = Firestore.firestore()




struct ContentView: View {
    
   
    var body: some View {
        
       
        Text("Hello World")
        }
        
}
        /*
         
         
         NavigationView{
         
         TabView {
         ShopsDetails()
         .tabItem {
         Image(systemName: "house.fill")
         
         Text("Home")
         }
         Text("Second View")
         .tabItem {
         Image(systemName: "person.fill")
         Text("My Tickets")
         }
         Text("The content of the third view")
         .tabItem {
         Image(systemName: "info.circle.fill")
         Text("iPark Info")
         }
         
         }
         .navigationBarTitle("iPark", displayMode:.inline)
         
         
         }
         
         */
        
        
        
    
    
    




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
