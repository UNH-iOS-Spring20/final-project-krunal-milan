//
//  RidesDetailsView.swift
//  iPark
//
//  Created by Milan Chalishajarwala on 5/6/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import SwiftUI

struct RidesDetailsView: View {
    @ObservedObject var ride:Ride
    var body: some View {
        VStack(alignment:.leading){
                   Text("\(ride.Name)").font(.system(size:25, weight:.semibold))
                   Text("Location: \(ride.Location)").font(.system(size:15, weight:.medium))
                   Text("Price: \(ride.Price)").font(.system(size:15, weight:.medium))
                   Text("Suitable For: \(ride.Age_Group)").font(.system(size:15, weight:.medium))

                   
                   
               }    }
}

struct RidesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RidesDetailsView(ride:Ride(id: "id", data: ["Name":"Name", "Location":"Location", "Age_Group":"Age_Group","Price":"Price" ])!)
    }
}
