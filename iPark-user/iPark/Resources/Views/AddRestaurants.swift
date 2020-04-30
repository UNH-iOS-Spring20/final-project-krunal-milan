//
//  AddRestaurants.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/11/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct AddRestaurants: View {
    @State private var selectedCategoryIndex: Int = 0
    private var categoryOptions = ["$", "$$", "$$$", "$$$$"]
    @State private var selectedLocationIndex: Int = 0
    private var locationOptions = ["East Corridor", "West Corridor", "North Gate", "South Gate"]
    @State private var selectedCuisineIndex: Int = 0
    private var cuisineOptions = ["Italian", "Mexican", "Indian", "Chinese", "Thai", "French"]
    @State  public var Name: String = "";
    @State public var Cuisine: String = ""
    @State  public var Location: String = "";
    @State  public var Category: String = "";
    @State public var Phone: String = "";
    @State  public var showingAlert = true

    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Add Restaurants Info")){
                    TextField("Add Name", text:$Name)
                    
                    Picker("Cuisine", selection: $selectedCuisineIndex) {
                        ForEach(0..<cuisineOptions.count) {
                            Text(self.cuisineOptions[$0])
                        }
                    }
                    
                  Picker("Location", selection: $selectedLocationIndex) {
                      ForEach(0..<locationOptions.count) {
                          Text(self.locationOptions[$0])
                      }
                  }
                    
                    Picker("Category", selection: $selectedCategoryIndex) {
                                       ForEach(0..<categoryOptions.count) {
                                           Text(self.categoryOptions[$0])
                                       }
                                   }
                    
                   
                    
                     TextField("Add Phone Number", text:$Phone)
                    
                }
                Section {
                    Button(action: {
                        self.createRestaurants(collection: "Restaurants")
                        
                    }) {
                        Text("Add Restaurant").multilineTextAlignment(.center
                        )
                    }
                    
                }
            }
        }.navigationBarTitle("Add Restaurant")
       
    }

    
    
    func createRestaurants(collection: String){
        let ShopsRef = db.collection("Restaurants")
        let Name : String = self.Name
        let Phone : String = self.Phone

        let Location: String = self.locationOptions[selectedLocationIndex]
        let Category: String = self.categoryOptions[selectedCategoryIndex]
        let Cuisine: String = self.cuisineOptions[selectedCuisineIndex]
        
        ShopsRef.document(Name).setData([
            "Name":Name,
            "Location":Location,
            "Category":Category,
            "Cuisine":Cuisine,
            "Phone":Phone,

        ])
        
        
    }
    
    

struct AddRestaurants_Previews: PreviewProvider {
    static var previews: some View {
        AddRestaurants()
    }
}
}
