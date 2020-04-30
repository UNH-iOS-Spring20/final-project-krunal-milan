//
//  ListOfRestaurants.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/26/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct ListOfRestaurants: View {
    @ObservedObject private var fbSession = firebaseSession
       
       var body: some View {
           VStack{
                   List{
                   
                   ForEach(fbSession.restaurants){
                       restaurant in
                       Section(header: Text(restaurant.Name)){
                           Text("Location: \(restaurant.Location)")
                        Text("Category: \(restaurant.Category)")
                        Text("Cuisine: \(restaurant.Cuisine)")

                           Text("Phone: \(restaurant.Phone)")
                       }
                       
                   }
                   
               }
               .navigationBarTitle(Text("Restaurants"))
                   
               
           }
       }
       
}

struct ListOfRestaurants_Previews: PreviewProvider {
    static var previews: some View {
        ListOfRestaurants()
    }
}
