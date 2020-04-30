//
//  UserPage.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 4/28/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct UserPage: View {
    @State var isLoggedin: Bool = false
    @State public var email: String = ""
    @State public var password: String = ""
    
    var body: some View {
        VStack{
            if isLoggedin == false {
                VStack(alignment:.leading){
                    NavigationView{
                        VStack{
                            Circleimage(image: Image("homeimage")).frame(height:120)
                            Spacer().frame(height:120)
                            VStack{
                                Text("Login").font(.headline)
                                TextField("Email Id", text:$email).padding(10)
                                    .font(Font.system(size: 15, weight: .medium, design: .serif))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                                Spacer().frame(height:30)
                                
                                SecureField("Password", text:$password)
                                    .padding(10)
                                    .font(Font.system(size: 15, weight: .medium, design: .serif))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                                Spacer().frame(height:30)
                                Button(action:{}){
                                    HStack{
                                        Text("Login")
                                        Image(systemName: "arrow.right.circle.fill")
                                    }
                                }.buttonStyle(GradientButtonStyle())
                            }.frame(width: 350, height:200, alignment: .leading)
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
            }else{
                Text("I am Logged in")
            }
        }
        
        
    }
    
    
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

struct UserPage_Previews: PreviewProvider {
    static var previews: some View {
        UserPage()
    }
}
