//
//  ShopDetailView.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/30/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct ShopDetailView: View {
    let shop:Shop
    var body: some View {
        VStack(alignment:.leading){
            Text(shop.Name).font(.largeTitle)
            
                HStack{
                    Text("Location: ")
                    Text(shop.Location)
                }
                HStack{
                    Text("Category: ")
                    Text(shop.Category)
                }
           

        }

    }
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(shop:Shop(id:"1", Name: "Milan", Location:"NH", Category: "$$$$"))
    }
}
