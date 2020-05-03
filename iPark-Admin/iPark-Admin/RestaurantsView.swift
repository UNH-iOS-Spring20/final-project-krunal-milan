//
//  ListofShops.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/30/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
let restaurantCollectionRef = Firestore.firestore().collection("Restaurants")
struct RestaurantsView: View {
    @ObservedObject private var restaurants = FirebaseCollection<Restaurant>(collectionRef: restaurantCollectionRef)
    var body: some View {
        NavigationView{
            VStack{

            NavigationLink(destination: AddShopsView()){
                Text("Add Restaurant")
            }
           
                List{
                    ForEach(restaurants.items){
                        restaurant in
                        NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)){
                            Text(restaurant.Name)
                        }
                    }.onDelete(perform: removeRestaurant)
                        
                }
        }
            .navigationBarTitle(Text("Restaurant"), displayMode: .inline)
            .navigationBarItems(leading: EditButton())
            Spacer()

        }
    }
    func removeRestaurant(at offsets: IndexSet){
        //restaurants.deleteItem(index: offsets.first!)
    }
}

struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}
