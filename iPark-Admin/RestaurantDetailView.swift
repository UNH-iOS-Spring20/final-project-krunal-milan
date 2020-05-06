//
//  RestaurantDetailView.swift
//  iPark-Admin
//
//  Created by Krunal Mistry on 5/2/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant:Restaurant
    var body: some View {
        VStack(alignment:.leading){
            Text(restaurant.Name).font(.largeTitle)
            
                HStack{
                    Text("Location: ")
                    Text(restaurant.Location)
                }
                HStack{
                    Text("Category: ")
                    Text(restaurant.Category)
                }
           

        }

    }
}
