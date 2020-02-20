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
        
        let iUserInfoWrong = User.init(firstName: "", lastName: "", email: "krunalmistry", phone: "")
    }
    
    func testRidesTickets(){
        let rideTicket = Ride.init(rideName:"jocker", ticketPrice:19.99)
        let rideTicket1 = Ride.init(rideName:"batMan", ticketPrice:17.99)
        
        let totalTickets = totalRides.init()
        XCTAssertEqual(0, totalTickets.rides.count)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
