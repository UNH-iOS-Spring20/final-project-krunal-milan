//
//  ListofShops.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/26/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct ListofShops: View {
    @ObservedObject private var fbSession = firebaseSession
    
    var body: some View {
        VStack{
                List{
                
                ForEach(fbSession.shops){
                    shop in
                    Section(header: Text(shop.Name)){
                        Text("Location: \(shop.Location)")
                        Text("Category: \(shop.Category)")
                    }
                    
                }
                
            }
            .navigationBarTitle(Text("Shops"))
                
            
        }
    }
    
}

struct ListofShops_Previews: PreviewProvider {
    static var previews: some View {
        ListofShops()
    }
}
