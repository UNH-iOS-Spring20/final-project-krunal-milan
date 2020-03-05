//
//  ContentView.swift
//  iPark
//
//  Created by Krunal Mistry on 2/19/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//


import SwiftUI
import FirebaseFirestore

let db = Firestore.firestore()

struct ContentView: View {
    var body: some View {
        VStack{
            
            Button(action: {
                createShops(collection: "Shops")
            }){
                Text("Create Shops")
                    .font(.largeTitle)
            }.padding(10.0)
            
            
        Button(action: {
            getShops(collection: "Shops")
        }){
            Text("Get all Shops")
                .font(.largeTitle)
        }.padding(10.0)
            
            
            Button(action: {
                           updateShops(collection: "Shops")
                       }){
                           Text("Update Shops")
                               .font(.largeTitle)
                       }.padding(10.0)
            
          
            Button(action: {
                       deleteAllShops(collection: "Shops")
                   }){
                       Text("Delete all Shops")
                           .font(.largeTitle)
            }.padding(10.0)
            
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
    
    ShopsRef.document("Modern Apizza").setData([
        "name":"Modern Apizza",
        "City":"New Haven",
        "State":"CT"
    ])
    
    ShopsRef.document("Frank Pepe").setData([
           "name":"Frank Pepe",
           "City":"New Haven",
           "State":"CT"
       ])
    
    ShopsRef.document("Slice Pizza").setData([
           "name":"Slice Pizza",
           "City":"New York",
           "State":"NY"
       ])
    
}

private func updateShops(collection: String){
    let ShopsRef = db.collection("Shops")
       
       ShopsRef.document("Modern Apizza").setData([
           "name":"Modern Apizza",
           "City":"New Haven",
           "State":"CT"
       ])
       
       ShopsRef.document("Frank Pepe").setData([
              "name":"Frank Pepe",
              "City":"Mumbai",
              "State":"MH"
          ])
       
       ShopsRef.document("Slice Pizza").setData([
              "name":"Slice Pizza",
              "City":"New London",
              "State":"CT"
          ])

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
