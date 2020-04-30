//
//  FirebaseSession.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/26/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import FirebaseFirestore

let firebaseSession = FirebaseSession();

class FirebaseSession: ObservableObject {
    @Published var shops = [Shop]()
    @Published var restaurants = [Restaurant]()
    @Published var rides  = [Ride]()
    
    let db = Firestore.firestore()
    
   
    init() {
       readShopData()
        readRestaurantsData()
        readRidesData()
    
    }
 
    public func readShopData(){
        db.collection("Shops").addSnapshotListener{querySnapshot1, error in
            guard let snapshot1 = querySnapshot1 else{
                print("Error fetching in snapshots: \(error!)")
                return
            }
            snapshot1.documentChanges.forEach{
                diff in
                if (diff.type == .added){
                    let shop = Shop(id: diff.document.documentID, Name: diff.document.get("Name") as! String,
                                    Location: diff.document.get("Location") as! String,Category: diff.document.get("Category") as! String)
                    self.shops.append(shop)
                }
                
            }
        }
    }
    
    
    //===============
    
    
   public func readRestaurantsData(){
        db.collection("Restaurants").addSnapshotListener{querySnapshot2, error in
            guard let snapshot2 = querySnapshot2 else{
                print("Error fetching in snapshots: \(error!)")
                return
            }
            snapshot2.documentChanges.forEach{
                diff in
                if (diff.type == .added){
                    let restaurant = Restaurant(
                        id: diff.document.documentID,
                        Name: diff.document.get("Name") as! String,
                        Location: diff.document.get("Location") as! String,
                        Category: diff.document.get("Category") as! String,
                        
                        Cuisine: diff.document.get("Cuisine") as! String,
                        
                        Phone: diff.document.get("Phone") as! String
                    )
                    self.restaurants.append(restaurant)
                }
                
            }
        }
    }
    
    //=================
    
    
     public func readRidesData(){
        db.collection("Rides").addSnapshotListener{querySnapshot3, error in
            guard let snapshot3 = querySnapshot3 else{
                print("Error fetching in snapshots: \(error!)")
                return
            }
            snapshot3.documentChanges.forEach{
                diff in
                if (diff.type == .added){
                    let ride = Ride(
                        id: diff.document.documentID,
                        Name: diff.document.get("Name") as! String,
                        Location: diff.document.get("Location") as! String,
                        Price: diff.document.get("Price") as! String,
                        Age_Group: diff.document.get("Age_Group") as! String
                        
                        
                    )
                    self.rides.append(ride)
                }
                
            }
        }
    }
    
}
