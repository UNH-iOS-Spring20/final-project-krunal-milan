//
//  iParkTests.swift
//  iParkTests
//
//  Created by Krunal Mistry on 2/19/20.
//  Copyright © 2020 Krunal Mistry. All rights reserved.
//

import XCTest
@testable import iPark

class iParkTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUserIntializationSucceeds(){
        let iUserInfo = User.init(firstName:"krunal", lastName:"mistry", email:"krunal@gmail.com", phone:"(203)822-1010")
        XCTAssertNotNil(iUserInfo)
    }

    func testUserIntializationFails(){
        let iUserNoInfo = User.init(firstName: "", lastName: "", email: "", phone: "(203)822-1010")
        XCTAssertNil(iUserNoInfo)
        
      //  let iUserInfoWrong = User.init(firstName: "", lastName: "", email: "krunalmistry", phone: "")
    }
    
    func testRidesTickets(){
   )
        
        let Rides = totalRides.init()
        XCTAssertEqual(0, Rides.listOfRides.count)
    
        
    }
    
    func testAddRides(){
        let Ride1  = Ride.init(rideName: "XYZ")
        let Ride2 = Ride.init(rideName: "ABC")
        let Rides = totalRides.init()
        Rides.addRide(myride: Ride1)
        Rides.addRide(myride: Ride2)
        XCTAssertEqual(2, Rides.returnTotalRides())
        
    }
    
    func testPerformanceExample(){
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
