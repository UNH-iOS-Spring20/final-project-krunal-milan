//
//  ContentView.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 3/6/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
let db = Firestore.firestore()

struct ContentView: View {
    
    var body: some View {
       
        VStack{
            Text("iPark Admin App").bold()
            
            
            
            VStack(alignment:.leading){
                NavigationView {
                    List {
                        
                        
                        NavigationLink(destination:ListofShops()){
                            Text("Shops").bold()
                        }.buttonStyle(PlainButtonStyle()).padding(15)
                        
                       
                            Text("Restaurants").bold()
                                .buttonStyle(PlainButtonStyle()).padding(15)
                        
                        
                        
                        
                        Text("Rides").bold()
                            .buttonStyle(PlainButtonStyle()).padding(15)
                        
                        
                        Text("Users").bold()
                            .buttonStyle(PlainButtonStyle()).padding(15)
                        
                        
                        
                    }
                }
                
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
