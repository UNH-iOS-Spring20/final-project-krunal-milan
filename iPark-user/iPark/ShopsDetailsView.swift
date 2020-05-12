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
        ScrollView{
        VStack{
            Spacer().frame(height: 50)

             Text("\(shop.Name)").font(.system(size:35, weight:.semibold))
            
          
           
            Circleimage(image: Image("Shop\(shop.Photo)"))
            Spacer().frame(height: 50)
            HStack{
           Text("Location:").font(.system(size:25, weight:.medium))
           Text(" \(shop.Location)").font(.system(size:20, weight:.light))
                
            }
            HStack{
           Text("Category:").font(.system(size:25, weight:.medium))
            Text(" \(shop.Category)").font(.system(size:20, weight:.light))
            }
            Spacer().frame(height: 20)

              MapView() .frame(height: 300)
            
             Spacer()
            }
             
        }
               
    }
}

struct ShopsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsDetailsView(shop:Shop(id: "id", data: ["Name":"Name", "Location":"Location", "Category":"Category", "Photo":"Photo"])!)
    }
}
