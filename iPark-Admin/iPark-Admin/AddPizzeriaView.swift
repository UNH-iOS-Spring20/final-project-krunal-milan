//
//  AddPizzeriaView.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/30/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct AddPizzeriaView: View {
    @Environment(\.presentationMode)var presentationMode
    @State private var Name:String = ""
    @State private var Location:String = ""
    @State private var Category:String = ""

    var body: some View {
        Group{
            VStack{
                HStack{
                    Text("Shop Name:")
                    TextField("Enter Name", text:$Name)
                }.padding(15)
                HStack{
                    Text("Shop Location:")
                    TextField("Enter Name", text:$Location)
                }.padding(15)
                HStack{
                    Text("Shop Category:")
                    TextField("Enter Category", text:$Category)
                }.padding(15)
                Button(action:{self.addPizzeria()}){
                    Text("Submit")
                }
            }
        }    }
    func addPizzeria(){
        print("Adding Pizzeria")
        if !Name.isEmpty && !Location.isEmpty && !Category.isEmpty{
            //TODO
            dismiss()
        }
        
    }
    
    func dismiss(){
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddPizzeriaView_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzeriaView()
    }
}
