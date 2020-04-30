//
//  ListofShops.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/26/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct ListofShops: View {
    @ObservedObject private var fbSession = firebaseSession

    
    var body: some View {
        
        VStack{
                List{
                
                ForEach(fbSession.shops){
                    shop in
                    Section(header: Text(shop.Name)){
                        Text("Location: \(shop.Location)")
                        Text("Category: \(shop.Category)")
                    }
                    Section {
                        Button(action: {
                            deleteShops(id: shop.id)
                            
                            
                        }) {
                            Text("Delete Shop").multilineTextAlignment(.center
                            )
                        
                    
                    }
                    }
                    
                }
                
            }
            .navigationBarTitle(Text("Shops"))
                
            
        }
    }
    
}

 func deleteShops(id: String){
    db.collection("Shops").getDocuments(){
        (querySnapshot, err) in
        if let err = err{
            print("Error getting documents: \(err)")
        }
        else{
            for document in querySnapshot!.documents{
                if(id == document.documentID){
                document.reference.delete()
                }
            }
        }
    }
    var shops = [Shop]()

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
                shops.append(shop)
                
            }
            
        }
    



    }
    
}


 
