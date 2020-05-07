//
//  RestaurantsDetailsView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct RestaurantsDetailsView: View {
    @ObservedObject var restaurant: Restaurant
    
    
    var body: some View {
        VStack{
            Spacer().frame(height: 50)
            Text("\(restaurant.Name), \(restaurant.Cuisine)").font(.system(size:25, weight:.semibold))
            
            Spacer().frame(height: 50)
            
             Circleimage(image: Image("Shop\(restaurant.Photo)"))
            Spacer().frame(height: 50)
            HStack{
                Text("Location:").font(.system(size:20, weight:.medium))
                Text(" \(restaurant.Location)").font(.system(size:15, weight:.light))
            }
            HStack{
                Text("Price Category:").font(.system(size:20, weight:.medium))
                Text(" \(restaurant.Category)").font(.system(size:15, weight:.light))
            }
            HStack{
                Text("Contact:").font(.system(size:20, weight:.medium))
                Text(" \(restaurant.Phone)").font(.system(size:15, weight:.light))
            }
            
            Spacer().frame(height: 20)
            
            NavigationLink(destination: MenuItems(restaurant: restaurant)){
                Text("View Menu")
                    .frame(width: 150, height: 50)
                    
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors:[Color(.black), Color(.black)]), startPoint: .leading, endPoint: .trailing
                    ))
                    .cornerRadius(5)
            }
        }
    }
}

struct RestaurantsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsDetailsView(restaurant: Restaurant(id: "1", data: ["Name": "Name", "Location":"Location", "Category":"Category", "Cuisine":"Cuisine", "Phone":"Phone"])!)
    }
}
