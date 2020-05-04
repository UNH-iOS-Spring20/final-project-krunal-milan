//
//  Signup.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 4/28/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    @EnvironmentObject var session: SessionStore

    @State public var email: String = ""
    @State public var password: String = ""
    @State public var error: String = ""
    var body: some View {
         VStack{
                    Text("Sign Up").font(.system(size: 32, weight: .heavy))
                    VStack(spacing: 18){
                        TextField("Email Address", text: $email).font(.system(size: 14)).padding(12)
                            .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),lineWidth: 1))
                        SecureField("Password", text: $password).font(.system(size: 14)).padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),lineWidth: 1))
                            .padding(.vertical, 64)
                        
                        Button(action: signUp){
                            Text("Sign Up")
                                .frame(minWidth:0, maxWidth: .infinity)
                                .frame(height:50)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight:.bold))
                                .background(LinearGradient(gradient: Gradient(colors:[Color(.gray), Color(.black)]),
                                startPoint: .leading, endPoint: .trailing)).cornerRadius(5)
                        }
                        if(error != ""){
                            Text(error).font(.system(size: 14, weight: .semibold)).foregroundColor(.red).padding()
                        }
        Spacer()
                        
                       
                    }
                }
         .padding(.horizontal, 32)    }
    
    func signUp () {
       
        session.signUp(email: email, password: password) { (result, error) in
           
            if let error = error{
                self.error = error.localizedDescription
            }
            else {
                self.email = ""
                self.password = ""
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
