//
//  ListofShops.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/30/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
let shopsCollectionRef = Firestore.firestore().collection("Shops")



struct ContentView: View {
    @ObservedObject private var shops = FirebaseCollection<Shop>(collectionRef: shopsCollectionRef)
    var body: some View {
        NavigationView{
            VStack{
                
                NavigationLink(destination: RestaurantsView()){
                    Text("Restaurants")
                }
                
                NavigationLink(destination: ShopsView()){
                    Text("Shops")
                }
                
            }
            .navigationBarTitle(Text("Admin"), displayMode: .inline)
            .navigationBarItems(leading: EditButton())
            Spacer()
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
