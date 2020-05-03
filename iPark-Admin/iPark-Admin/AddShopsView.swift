//
//  AddPizzeriaView.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/30/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct AddShopsView: View {
    @Environment(\.presentationMode)var presentationMode
    @State private var Name:String = ""
    @State private var Location:String = ""
    @State private var Category:String = ""

    var body: some View {
        Group{
            VStack(spacing: 25){
                HStack{
                    Text("Shop Name:")
                    TextField("Enter Name", text:$Name)
                }
                HStack{
                    Text("Shop Location:")
                    TextField("Enter Name", text:$Location)
                }
                HStack{
                    Text("Shop Category:")
                    TextField("Enter Category", text:$Category)
                }
                Button(action:{self.addShops()}){
                    Text("Submit")
                }
                Spacer()
            }
        .navigationBarTitle("Add Shops")
        }
    .padding()
        
    }
    func addShops(){
        print("Adding Shops")
        if !Name.isEmpty && !Location.isEmpty && !Category.isEmpty{
            let data = ["Name" : Name, "Location" : Location, "Category" : Category]
            shopsCollectionRef.addDocument(data: data)
            dismiss()
        }
    }
    
    func dismiss(){
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddShopsView_Previews: PreviewProvider {
    static var previews: some View {
        AddShopsView()
    }
}
