//
//  ListofRides.swift
//  iPark-Admin
//
//  Created by Milan Chalishajarwala on 4/26/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct ListofRides: View {
     @ObservedObject private var fbSession = firebaseSession
        
        var body: some View {
            VStack{
                    List{
                    
                    ForEach(fbSession.rides){
                        ride in
                        Section(header: Text(ride.Name)){
                            Text("Location: \(ride.Location)")
                            Text("Age Group: \(ride.Age_Group)")
                            Text("Price: \(ride.Price)")

                        }
                        
                    }
                    
                }
                .navigationBarTitle(Text("Rides"))
                    
                
            }
        }
        
    }

struct ListofRides_Previews: PreviewProvider {
    static var previews: some View {
        ListofRides()
    }
}
