//
//  UserPassView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/5/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct UserPassView: View {
    let pass:Pass
    @EnvironmentObject var session: SessionStore

    @ObservedObject public var userdetails = FirebaseCollection<UserDetails>(collectionRef: usersCollectionReference)


    var body: some View {
        Group{
        VStack{
            HStack{
                Text("\(pass.Typeofticket) Ticket").font(.system(size: 25, weight:. semibold)).padding(15)
            }
            VStack{
                Text("Valid From: \(pass.Validfrom)")
                Text("Valid Upto: \(pass.Validupto)")
                
            }.font(.system(size: 20, weight:. semibold)).padding(20)
            ForEach(userdetails.items){
            pass1 in
            if(pass1.Email == self.session.email1){
            HStack{
            Text("\(pass1.FirstName)")
            Text("\(pass1.LastName)")
                    }
                }
                
            }.font(Font.custom("Chalkboard", size: 25)).padding(.vertical, 40)
            Image("barcode").resizable().frame(width: 150, height: 150)
            Spacer()
        }.frame(width: 350, height:500).background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),lineWidth: 1)).padding(.horizontal, 32)
            }
        
    }
}

struct UserPassView_Previews: PreviewProvider {
    static var previews: some View {
        UserPassView(pass: Pass(id:"1", data:[ "Amountcharged": "22", "Useremail": "id@email.com", "Validfrom": "Today", "Validupto": "1 Year", "Typeofticket":"Yearly Pass"])!)
    }
}

