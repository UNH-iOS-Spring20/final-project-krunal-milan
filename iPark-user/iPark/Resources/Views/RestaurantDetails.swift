//
//  RestaurantDetails.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/12/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct RestaurantDetails: View {
    var body: some View {
        VStack(alignment:.leading){
            List{
                NavigationLink(destination:AddRestaurants()){
                    Text("Add Restaurant").bold()
                }.padding(15.0)
                
                NavigationLink(destination: ListOfRestaurants()){
                Text("Get Restaurants").bold()
                }.padding(15.0)
                
                Text("Update Restaurant").bold()
                    .padding(15.0)
                
                Text("Delete Restaurants").bold()
                    .padding(15.0)
            }
        }
    }
}

struct RestaurantDetails_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetails()
    }
}
