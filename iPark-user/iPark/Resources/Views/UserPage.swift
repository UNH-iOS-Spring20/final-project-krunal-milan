//
//  UserPage.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 4/28/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct UserPage: View {
    
    @EnvironmentObject var session: SessionStore
    
    func getUser(){
        session.listen()
    }
    
    var body: some View {
        
        Group{
            if(session.session != nil){
                Text("Hello User!")
            }else{
                Login()
                
            }
        }.onAppear(perform: getUser)
    }
    
    
}



struct UserPage_Previews: PreviewProvider {
    static var previews: some View {
        UserPage()
    }
}
