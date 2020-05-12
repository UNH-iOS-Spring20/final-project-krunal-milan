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
        VStack{
            Spacer().frame(height: 50)
            Text("\(ride.Name)").font(.system(size:25, weight:.semibold))
            
            Spacer().frame(height: 50)
            Circleimage(image: Image("Ride\(ride.Photo)"))
            Spacer().frame(height: 50)
            HStack{
                Text("Location:").font(.system(size:20, weight:.medium))
                Text("\(ride.Location)").font(.system(size:15, weight:.light))
            }
            HStack{
                Text("Price:").font(.system(size:20, weight:.medium))
                 Text("\(ride.Price)").font(.system(size:15, weight:.light))
            }
            HStack{
                Text("Suitable For:").font(.system(size:20, weight:.medium))
                Text("\(ride.Age_Group)").font(.system(size:15, weight:.light))
            }
            Spacer()
        }
        
    }
}

struct RidesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RidesDetailsView(ride:Ride(id: "id", data: ["Name":"Name", "Location":"Location", "Age_Group":"Age_Group","Price":"Price", "Photo":"Photo" ])!)
    }
}
