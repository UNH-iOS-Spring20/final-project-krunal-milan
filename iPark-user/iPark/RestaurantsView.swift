//
//  RestaurantsView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct RestaurantsView: View {
    @ObservedObject public var restaurants = FirebaseCollection<Restaurant>(collectionRef: restaurantCollectionReference)
    
    var body: some View {
        
        List{
            Section(header:Text("Restaurants")){
                ForEach(restaurants.items){
                    restaurant in
                    NavigationLink(destination: RestaurantsDetailsView(restaurant: restaurant)){
                        HStack{
                            Text("\(restaurant.Name)").padding(10)
                            Spacer()
                            IconImage(image: Image("Shop\(restaurant.Photo)"))
                        }
                    }
                }
            }
            .navigationBarTitle("Restaurants")
        }
    }
}

struct RestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}
