//
//  RidesView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct RidesView: View {
   @ObservedObject public var rides = FirebaseCollection<Ride>(collectionRef: rideCollectionReference)
    
    var body: some View {
        
            List{
                Section(header:Text("Rides")){
                ForEach(rides.items){
                    ride in
                    NavigationLink(destination: RidesDetailsView(ride: ride)){
                        Text("\(ride.Name)")
                    }
                }
            }
        }
   
    }
}

struct RidesView_Previews: PreviewProvider {
    static var previews: some View {
        RidesView()
    }
}
