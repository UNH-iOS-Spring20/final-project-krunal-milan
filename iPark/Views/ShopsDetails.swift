//
//  ShopsDetails.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 3/5/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct ShopsDetails: View {
    var body: some View {
     VStack(alignment:.leading){
        List{
               Button(action: {
                   createShops(collection: "Shops")
               }){
                   Text("Create Shops").bold()
                
                       
               }.padding(15.0)
               
               
           Button(action: {
               getShops(collection: "Shops")
           }){
               Text("Get Shops").bold()
                   
           }.padding(15.0)
               
             
               Button(action: {
                              updateShops(collection: "Shops")
                          }){
                           Text("Update Shops").bold()
                                 
                          }.padding(15.0)
               
             
               Button(action: {
                          deleteAllShops(collection: "Shops")
                      }){
                       Text("Delete Shops").bold()
                             
               }.padding(15.0)
    
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

    private func createShops(collection: String){
        let ShopsRef = db.collection("Shops")
        
        ShopsRef.document("Gifts Collection").setData([
            "Name":"Gifts Collection",
            "Location":"East Corridor",
            "Category":"$$"
        ])
        
        ShopsRef.document("Big Top Souvenirs").setData([
               "Name":"Big Top Souvenirs",
               "City":"West Gate",
               "Category":"$$$"
           ])
        
        ShopsRef.document("Calypso Trading Post").setData([
               "Name":"Calypso Trading Post",
               "City":"South Corridor",
               "Category":"$"
           ])

        ShopsRef.document("The Brass Bazaar").setData([
                  "Name":"The Brass Bazaar",
                  "City":"South Corridor",
                  "Category":"$$"
              ])

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
    
struct ShopsDetails_Previews: PreviewProvider {
    static var previews: some View {
        ShopsDetails()
    }
}

