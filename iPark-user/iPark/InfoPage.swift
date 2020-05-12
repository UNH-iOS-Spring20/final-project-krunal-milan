//
//  InfoPage.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct InfoPage: View {
    var body: some View {
        ScrollView{
        VStack(){
            Spacer().frame(height: 10)
            VStack{
            Text("iPark Amusement Park").font(.system(size: 25, weight: .semibold))
            Text("Est. 2020").font(.system(size: 15, weight: .light))
            }
            Spacer().frame(height: 10)
            VStack{
                Text("2548  Arthur Avenue")
                Text("Lockport,IN 46225")
                Spacer().frame(height: 10)
                
                VStack{
                    Text("Phone: 765-978-3513").padding(2)
                    Text("Email: info@ipark.info").padding(2)
                }.font(.system(size: 15, weight: .light))
            }.font(.system(size: 20, weight: .medium))
            Spacer().frame(height: 20)
           
              MapView().frame(height: 300)
            }
            NavigationLink(destination: ShopsView()){
                Text("Shops").foregroundColor(.black).frame(width: 350, height: 100).background(Color(.systemGroupedBackground)).background(RoundedRectangle(cornerRadius: 15)).padding(10)
            }
            NavigationLink(destination: RestaurantsView()){
                Text("Restaurants").foregroundColor(.black).frame(width: 350, height: 100).background(Color(.systemGroupedBackground)).background(RoundedRectangle(cornerRadius: 5)).padding(10)
            }
            NavigationLink(destination: RidesView()){
                Text("Rides").foregroundColor(.black).frame(width: 350, height: 100).background(Color(.systemGroupedBackground)).background(RoundedRectangle(cornerRadius: 5)).padding(10)
            }
            
            
           
             Spacer()
        }
    }
    }


struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage()
    }
}
