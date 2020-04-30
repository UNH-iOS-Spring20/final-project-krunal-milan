//
//  AddShops.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/11/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct AddShops: View {
    @State public var categoryIndex: Int = 0
    public var categoryOptions = ["$", "$$", "$$$", "$$$$"]
    public var locationOptions = ["East Corridor", "West Corridor", "North Gate", "South Gate"]
    @State public var locationIndex: Int = 0
    
    @State  public var name: String = "";
    // @State  public var location: String = "";
    @State  public var category: String = "";
    @State  public var showingAlert = true
    @State public var submit = false
    
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Add Shop Info")){
                    TextField("Add Name", text:$name)
                    Picker(selection: $locationIndex, label: Text("Location")) {
                        ForEach(0..<locationOptions.count) {
                            Text(self.locationOptions[$0])
                        }
                    }
                    
                    Picker("Category", selection: $categoryIndex) {
                        ForEach(0..<categoryOptions.count) {
                            Text(self.categoryOptions[$0])
                        }
                    }
                    
                }
                Section {
                    Button(action: {
                        self.createShops(collection: "Shops")
                        self.submit.toggle()
                        
                    }) {
                        Text("Add Shop").multilineTextAlignment(.center
                        )
                    }
                }
            }
            
        }.navigationBarTitle("Add Shop")
        
    }
    
    
    
    func createShops(collection: String){
        let ShopsRef = db.collection("Shops")
        let name : String = self.name
        let location: String = self.locationOptions[locationIndex]
        let category: String = self.categoryOptions[categoryIndex]
        
        ShopsRef.document().setData([
            "Name":name,
            "Location":location,
            "Category":category
        ])
        
        
    }
    
    
    
    struct AddShops_Previews: PreviewProvider {
        static var previews: some View {
            AddShops()
        }
    }
}
