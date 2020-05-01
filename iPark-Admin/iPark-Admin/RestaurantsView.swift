//
//  ListofShops.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/30/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
let query1 = Firestore.firestore().collection("Restaurants")
struct RestaurantsView: View {
    @ObservedObject private var restaurants = FirebaseCollection<Restaurant>(query: query1)
    var body: some View {
        NavigationView{
            VStack{

            NavigationLink(destination: AddPizzeriaView()){
                Text("Add Pizzeria")
            }
           
                List{
                    ForEach(restaurants.items){
                        restaurant in
                       
                            Text(restaurant.Name)
                         Text(restaurant.Location)
                         Text(restaurant.Category)
                         Text(restaurant.Phone)
                         Text(restaurant.Cuisine)
                        
                    }.onDelete(perform: removeShop)
                        
                }
        }
            .navigationBarTitle(Text("Shops"), displayMode: .inline)
            .navigationBarItems(leading: EditButton())
            Spacer()

        }
    }
    func removeShop(at offsets: IndexSet){
        restaurants.deleteItem(index: offsets.first!)
    }
}

struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}
