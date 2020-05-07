//
//  ShopsDetailsView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct ShopsDetailsView: View {
    @ObservedObject var shop:Shop
    var body: some View {
        VStack{
            Spacer().frame(height: 50)

             Text("\(shop.Name)").font(.system(size:35, weight:.semibold))
            Spacer().frame(height: 50)

            Circleimage(image: Image("Shop\(shop.Photo)"))
            Spacer().frame(height: 100)
           Text("Location: \(shop.Location)").font(.system(size:25, weight:.medium))
           Text("Price Category: \(shop.Category)").font(.system(size:25, weight:.medium))
            
             Spacer()
            }
                 
               
    }
}

struct ShopsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsDetailsView(shop:Shop(id: "id", data: ["Name":"Name", "Location":"Location", "Category":"Category", "Photo":"Photo"])!)
    }
}
