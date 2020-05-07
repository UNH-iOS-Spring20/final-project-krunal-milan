//
//  MenuItems.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct MenuItems: View {

     @ObservedObject var restaurant: Restaurant
    @ObservedObject var menu: FirebaseCollection<MenuItem>
    private var menuCollectionRef: CollectionReference
    
    init(restaurant: Restaurant){
        self.restaurant = restaurant
        self.menuCollectionRef = restaurantCollectionReference.document(restaurant.id).collection("Menu")
        self.menu = FirebaseCollection<MenuItem>(collectionRef: menuCollectionRef)
    }
    
    
    var body: some View {
        List{
            Section(header: Text("Menu for \(restaurant.Name)")){
        ForEach(menu.items){
            item in
            HStack{
            Text("\(item.Name)")
                Spacer()
                Text("\(item.Price)")
            }
        }
        }
    }
}
}

struct MenuItems_Previews: PreviewProvider {
    static var previews: some View {
        MenuItems(restaurant: Restaurant(id: "1", data: ["Name": "Name", "Location":"Location", "Category":"Category", "Cuisine":"Cuisine", "Phone":"Phone"])!)
        
    }
}
