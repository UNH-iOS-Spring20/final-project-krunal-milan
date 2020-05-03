//
//  ShopDetailView.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/30/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct ShopDetailView: View {
    @ObservedObject var shop:Shop
    
    var body: some View {
        VStack{
                HStack{
                    
                    Text(shop.Location)
                    Text(shop.Category)
                    Spacer()
                }
                NavigationLink(destination: EditShopView(shop:shop)){
                    Text("Edit")
                }
            Spacer()
        }
//        padding()
//        .navigationBarTitle(shop.Name)
    }
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(shop:
            Shop(id:"1", data: ["Name" : "H&M",
                                "Location" : "NH",
                                "Category" : "$$$$" ])!)
    }
}
