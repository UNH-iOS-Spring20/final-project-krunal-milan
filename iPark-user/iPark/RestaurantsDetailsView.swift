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
@State var typeofattb: [String] = ["Info", "Menu", "Location"]
 @State var typeofattbselector: Int = 0
    @ObservedObject var menu: FirebaseCollection<MenuItem>
       private var menuCollectionRef: CollectionReference
       
       init(restaurant: Restaurant){
           self.restaurant = restaurant
           self.menuCollectionRef = restaurantCollectionReference.document(restaurant.id).collection("Menu")
           self.menu = FirebaseCollection<MenuItem>(collectionRef: menuCollectionRef)
       }
       
    
    var body: some View {
        VStack{
            Picker(selection: $typeofattbselector, label: Text("")) {
                 ForEach(0 ..< typeofattb.count) {
                    Text(self.typeofattb[$0])
               }
            }.pickerStyle(SegmentedPickerStyle()).padding(10)
           
            Spacer().frame(height: 50)
            if(typeofattbselector == 0){
            Text("\(restaurant.Name), \(restaurant.Cuisine)").font(.system(size:25, weight:.semibold))
            
            Spacer().frame(height: 50)
            
             Circleimage(image: Image("Shop\(restaurant.Photo)"))
            Spacer().frame(height: 50)
           
            HStack{
                Text("Price Category:").font(.system(size:20, weight:.medium))
                Text(" \(restaurant.Category)").font(.system(size:15, weight:.light))
            }
            HStack{
                Text("Contact:").font(.system(size:20, weight:.medium))
                Text(" \(restaurant.Phone)").font(.system(size:15, weight:.light))
            }
            
            Spacer().frame(height: 20)
            
            
           
            }
            if(typeofattbselector == 2){
                ScrollView{
                HStack{
                            Text("Location:").font(.system(size:20, weight:.medium))
                            Text(" \(restaurant.Location)").font(.system(size:15, weight:.light))
                           }
                Spacer().frame(height: 20)
                MapView().frame(height: 300)
            }
                Spacer()
            }
            if(typeofattbselector == 1){
                List{
                          
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
            
        Spacer()
        }
    }
}

struct RestaurantsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsDetailsView(restaurant: Restaurant(id: "1", data: ["Name": "Name", "Location":"Location", "Category":"Category", "Cuisine":"Cuisine", "Phone":"Phone"])!)
    }
}
