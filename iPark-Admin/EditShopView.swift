//
//  EditShopView.swift
//  iPark-Admin
//
//  Created by Krunal Mistry on 5/2/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct EditShopView: View {
    @ObservedObject var shop: Shop
    @Environment(\.presentationMode)var presentationMode
    
    
    var body: some View {
        Group{
            VStack(spacing: 25){
                HStack{
                    Text("Shop Name:")
                    TextField("Enter Name", text:$shop.Name)
                }
                HStack{
                    Text("Shop Location:")
                    TextField("Enter Name", text:$shop.Location)
                }
                HStack{
                    Text("Shop Category:")
                    TextField("Enter Category", text:$shop.Category)
                }
                Button(action:{self.updateShop()}){
                    Text("Save")
                }
                Spacer()
            }
            .navigationBarTitle("Edit \(shop.Name)")
        }
    }
    
    func updateShop(){
        print("Editing Shop")
        if !shop.Name.isEmpty && !shop.Location.isEmpty && !shop.Category.isEmpty{
            shopsCollectionRef.document(shop.id).setData(shop.data)
            dismiss()
        }
    }
    
    func dismiss(){
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditShopView_Previews: PreviewProvider {
    static var previews: some View {
        EditShopView(shop:
        Shop(id:"1", data: ["Name" : "H&M",
                            "Location" : "NH",
                            "Category" : "$$$$" ])!)
    }
}
