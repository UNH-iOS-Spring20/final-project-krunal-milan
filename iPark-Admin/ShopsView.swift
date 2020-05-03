//
//  ShopesView.swift
//  iPark-Admin
//
//  Created by Krunal Mistry on 5/2/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let shopCollectionRef = Firestore.firestore().collection("Shops")
struct ShopsView: View {
    @ObservedObject private var shops = FirebaseCollection<Shop>(collectionRef: shopCollectionRef)
    var body: some View {
        NavigationView{
            VStack{

            NavigationLink(destination: AddShopsView()){
                Text("Add Shops")
            }
           
                List{
                    ForEach(shops.items){
                        shop in
                        NavigationLink(destination: ShopDetailView(shop:shop)){
                            Text(shop.Name)
                        }
                    }.onDelete(perform: deleteShop)
                        
                }
        }
            .navigationBarTitle(Text("Shops"), displayMode: .inline)
            .navigationBarItems(leading: EditButton())
            Spacer()

        }
    }
    
    func deleteShop(at offsets: IndexSet){
        let index = offsets.first!
        print("Deleting Shops: \(shops.items[index].Name)")
        let id = shops.items[index].id
        shopsCollectionRef.document(id).delete() {
            error in
            if let error = error {
                print("Error deleting document: \(error)")
            }else {
                print("Document Successfully removed")
            }
        }
    }
}

struct ShopsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsView()
    }
}
