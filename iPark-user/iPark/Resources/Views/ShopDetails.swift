//
//  ShopDetails.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 3/6/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI


struct ShopDetails: View {
    var body: some View {
        VStack(alignment:.leading){
            List{
                NavigationLink(destination:AddShops()){
                    Text("Add Shop").bold()
                }.padding(15.0)
                
                NavigationLink(destination: ListofShops()) {
                    Text("Get Shops").multilineTextAlignment(.center
                    )
                    }.padding(15.0)
                
                Text("Update Shop").bold()
                    .padding(15.0)
                
                Text("Delete Shop").bold()
                    .padding(15.0)
            }
        }
    }
}

private func getShops(collection: String){
    db.collection(collection).getDocuments(){
        (querySnapshot, err) in
        if let err = err{
            print("Error getting documents: \(err)")
        }
        else{
            for document in querySnapshot!.documents{
           /*     if let name = document.value["name"] as? String {
                    print(name)
                }*/
                print("\(document.documentID) => \(document.data())")
            }
        }
    }
}





private func deleteAllShops(collection: String){
    db.collection(collection).getDocuments(){
        (querySnapshot, err) in
        if let err = err{
            print("Error getting documents: \(err)")
        }
        else{
            for document in querySnapshot!.documents{
                print("Deleting:\(document.documentID) => \(document.data())")
                document.reference.delete()
            }
        }
    }
}


private func updateShops(collection: String){
    let ShopsRef = db.collection("Shops")
    
    ShopsRef.document("Gifts Collection").setData([
        "Name":"Gifts Collection",
        "Location":"East Corridor",
        "Category":"$$",
        "What Can you get":"Gifts and Toys"
        
    ])
    
    ShopsRef.document("Big Top Souvenirs").setData([
        "Name":"Big Top Souvenirs",
        "City":"West Gate",
        "Category":"$$$",
        "What Can you get":"Housewares, Gifts and Magicbands"
    ])
    
    ShopsRef.document("Calypso Trading Post").setData([
        "Name":"Calypso Trading Post",
        "City":"South Corridor",
        "Category":"$",
        "What Can you get":"Housewares, Media, Plush and Spirits"
    ])
    
    ShopsRef.document("The Brass Bazaar").setData([
        "Name":"The Brass Bazaar",
        "City":"South Corridor",
        "Category":"$$",
        "What can you get":"Gifts and Housewares"
    ])
    
    
}



struct ShopDetails_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetails()
    }
}


