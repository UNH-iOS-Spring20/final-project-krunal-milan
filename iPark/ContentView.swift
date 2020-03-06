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
       
        VStack{
            
                Circleimage(image: Image("homeimage")).frame(width:450, height:350)
            Text("iPARK").foregroundColor(.red).frame( width:50, height:10).padding(10)
                  VStack(alignment:.leading){
            NavigationView {
                              List {
               
               
                NavigationLink(destination:ShopsDetails()){
                   Text("Shops").bold()
                }.buttonStyle(PlainButtonStyle()).padding(15)
               
               
         Text("Restaurants").bold()
           .buttonStyle(PlainButtonStyle()).padding(15)
               
               
               
               
               
                          Text("Rides").bold()
               .buttonStyle(PlainButtonStyle()).padding(15)
               
             
              Text("Users").bold()
               .buttonStyle(PlainButtonStyle()).padding(15)
               
           
        
        }
            }.padding (10)
                    
            }
           
            Spacer()
        
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
