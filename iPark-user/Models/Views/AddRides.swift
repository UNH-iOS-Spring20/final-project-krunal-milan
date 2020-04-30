//
//  AddShops.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/11/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct AddRides: View {
    @State public var agegroupIndex: Int = 0
    public var agegroupOptions = ["Children", "Adult", "Both"]
    public var locationOptions = ["East Corridor", "West Corridor", "North Gate", "South Gate"]
    @State public var locationIndex: Int = 0
    
    @State  public var Name: String = "";
    @State public var Price: String = "";
    
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Add Shop Info")){
                    TextField("Add Name", text:$Name)
                    Picker(selection: $locationIndex, label: Text("Location")) {
                        ForEach(0..<locationOptions.count) {
                            Text(self.locationOptions[$0])
                        }
                    }
                    
                    Picker("Age Group", selection: $agegroupIndex) {
                        ForEach(0..<agegroupOptions.count) {
                            Text(self.agegroupOptions[$0])
                        }
                    }
                    
                    
                    TextField("Add Price", text: $Price).keyboardType(.numberPad)

                    
                }
                Section {
                    Button(action: {
                        self.createRides(collection: "Shops")
                        
                    }) {
                        Text("Add Shop").multilineTextAlignment(.center
                        )
                    }
                    
                }
            }
        }.navigationBarTitle("Add Shop")
        
    }
    
    
    
    func createRides(collection: String){
        let ShopsRef = db.collection("Rides")
        let Name : String = self.Name
        let Location: String = self.locationOptions[locationIndex]
        let Price: String = self.Price
        let Age_Group: String = self.agegroupOptions[agegroupIndex]

        
        
        ShopsRef.document().setData([
            "Name":Name,
            "Location":Location,
            "Price":"$\(Price)",
             "Age_Group":Age_Group,
        ])
        
        
    }
    
    
    
    struct AddShops_Previews: PreviewProvider {
        static var previews: some View {
            AddRides()
        }
    }
}
