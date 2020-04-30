//
//  ContainerController.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 4/28/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct ContainerController: View {
    var body: some View {
        NavigationView{
        TabView{
            Text("HomePage Goes Here")
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                    
            }
            Text("Tickets Goes Here")
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Tickets")
                    
            }
            UserPage()
                .tabItem{
                    Image(systemName: "person.crop.circle.fill")
                    Text("My Info")
                    
            }
            Text("iPark Info Goes Here")
                .tabItem{
                    Image(systemName: "info.circle.fill")
                    Text("iPark Info")
                    
            }
        }
        .navigationBarTitle(Text("iPark").font(.system(.title, design: .serif)), displayMode: .inline)

    }
    }
    
    
}

struct ContainerController_Previews: PreviewProvider {
    static var previews: some View {
        ContainerController()
    }
}
