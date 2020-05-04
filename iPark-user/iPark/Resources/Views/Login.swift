//
//  Login.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 4/28/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var session: SessionStore

    @State public var email: String = ""
    @State public var password: String = ""
    @State public var error: String = ""

    
    

   
    var body: some View {
        VStack{
            Text("Welcome Back").font(.system(size: 32, weight: .heavy))
            Text("Sign In To Continue").font(.system(size: 18, weight: .medium)).foregroundColor(.gray)
            VStack(spacing: 18){
                TextField("Email Address", text: $email).font(.system(size: 14)).padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),lineWidth: 1))
                SecureField("Password", text: $password).font(.system(size: 14)).padding(12)
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),lineWidth: 1))
                    .padding(.vertical, 64)
                
                Button(action: signIn){
                    Text("Sign In")
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
                
                NavigationLink(destination: Login()){
                    HStack{
                        Text("I'm a New User")
                        Text("Sign Up")
                    }
                }
            }
        }
        .padding(.horizontal, 32)
        /*
        VStack{
                VStack(alignment:.leading){
                    NavigationView{
                        VStack{
                            
                            Circleimage(image: Image("homeimage")).frame(height:120)
                            Spacer().frame(height:120)
                            VStack{
                                Text("Login").font(.headline)
                                TextField("Email Id", text:$email).padding(10)
                                    
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                                Spacer().frame(height:30)
                                
                                SecureField("Password", text:$password)
                                    .padding(10)
                                    .font(Font.system(size: 15, weight: .medium, design: .serif))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                                Spacer().frame(height:30)
                                Button(action:signIn)
                                {
                                    HStack{
                                        Text("Login")
                                        Image(systemName: "arrow.right.circle.fill")
                                    }
                                }.buttonStyle(GradientButtonStyle())
                            }.frame(width: 350, height:200, alignment: .leading)
                            if(error != ""){
                                Text(error)
                            }
                            Spacer().frame(height:20)
                            NavigationLink(destination:SignUp()){
                                Button(action:{}){
                                    Text("New User?")
                                    
                                }
                            }
                            Spacer().frame(height:140)
                            
                            
                        }
                    }
                }
 */
            }
 
        
    
    
    struct GradientButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(Color.white)
                .padding(10)
                .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(5.0)
        }
    }


func signIn () {
   
    session.signIn(email: email, password: password) { (result, error) in
       
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
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
