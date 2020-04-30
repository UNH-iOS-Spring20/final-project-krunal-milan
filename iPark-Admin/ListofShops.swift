//
//  ListofShops.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/30/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
let query = Firestore.firestore().collection("Shops")



struct ListofShops: View {
    @ObservedObject private var shops = FirebaseCollection<Shop>(query: query)
    var body: some View {
        List{
            ForEach(shops.items){
                shop in
                Text(shop.Name)
            }
        }
    }
}

struct ListofShops_Previews: PreviewProvider {
    static var previews: some View {
        ListofShops()
    }
}
