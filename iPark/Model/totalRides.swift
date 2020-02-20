//
//  totalRides.swift
//  iPark
//
//  Created by Krunal Mistry on 2/19/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

class totalRides {
    var listOfRides = [Ride]()
    
    func addRide (myride:Ride) {
        listOfRides.append(myride)
    }
  
   
    func returnTotalRides() -> Int{
        var numberOfRides: Int = 0
        for _ in listOfRides{
            numberOfRides += 1
        }
        return numberOfRides
    }
}
    
