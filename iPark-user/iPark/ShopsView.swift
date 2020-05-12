//
//  ShopsView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct ShopsView: View {
    @ObservedObject public var shops = FirebaseCollection<Shop>(collectionRef: shopCollectionReference)
    
    var body: some View {
        
            List{
                Section(header: Text("Shops")){
                ForEach(shops.items){
                    shop in
                    NavigationLink(destination: ShopsDetailsView(shop: shop)){
                        HStack{
                        Text("\(shop.Name)").padding(10)
                        Spacer()
                            IconImage(image: Image("Shop\(shop.Photo)"))
                    }
                    }
                }
            }
        .navigationBarTitle("Shops")
        }
    }
    
}

struct ShopsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsView()
    }
}
