//
//  Homepage.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        
            ZStack{
                Image("homepage").resizable().frame(width:450, height: 850)
                VStack{
                    Spacer().frame(height: 90)
                    Text("Welcome To iPark").foregroundColor(.pink).font(.system(size: 45, weight:.bold)).frame(width:400, height: 55)
                    
                    .background(LinearGradient(gradient: Gradient(colors:[Color(.white), Color(.white)]), startPoint: .leading, endPoint: .trailing
                    )).cornerRadius(5).padding(5)
                    Spacer()
                    HStack{
                        NavigationLink(destination: TicketsView()){
                            Text("Buy Tickets").frame(width: 170, height: 40)
                                
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                                .background(LinearGradient(gradient: Gradient(colors:[Color(.systemYellow), Color(.systemYellow)]), startPoint: .leading, endPoint: .trailing
                                )).cornerRadius(5).padding(5)
                            
                        }
                        NavigationLink(destination: InfoPage()){
                            Text("Explore iPark").frame(width: 170, height: 40).foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                                .background(LinearGradient(gradient: Gradient(colors:[Color(.systemYellow), Color(.systemYellow)]), startPoint: .leading, endPoint: .trailing
                                )).cornerRadius(5).padding(5)
                        }
                    }.padding(.horizontal, 20)
                    Spacer().frame(height: 250)
                }
            }
        }
     
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
