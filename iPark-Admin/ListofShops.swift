//
//  ListofShops.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/30/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
//let query = Firestore.firestore().collection("Shops")


let shopListCollectionRef = Firestore.firestore().collection("Shops")
struct ListofShops: View {
    @ObservedObject private var shops = FirebaseCollection<Shop>(collectionRef: shopListCollectionRef)
    var body: some View {
        NavigationView{
            NavigationLink(destination: AddShopsView()){
                Text("Add Shops")
                }
            VStack{
                List{
                    ForEach(shops.items){
                        shop in
                        NavigationLink(destination: ShopDetailView(shop:shop)){
                            Text(shop.Name)
                        }
                    }.onDelete(perform: removeShop)
                        
                }
        }
            .navigationBarTitle(Text("Shops"), displayMode: .inline)
            .navigationBarItems(leading: EditButton())
            Spacer()

        }
    }
    func removeShop(at offsets: IndexSet){
        //shops.deleteItem(index: offsets.first!)
    }
}

struct ListofShops_Previews: PreviewProvider {
    static var previews: some View {
        ListofShops()
    }
}
