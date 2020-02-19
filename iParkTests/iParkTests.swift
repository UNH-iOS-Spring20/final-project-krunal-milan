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
    
    
    func newTestInvalidValues() {
        let emptyName = User.init(Fname:"", Lname: "", Phone: [9,8,7,6,5,4,3,2,1,0])
               XCTAssertNil(emptyName)

        let incorrectPhoneNumber = User.init(Fname: "Michael", Lname: "Jordan",Phone: [0,1,2,3,4,5,6,7,8])
        XCTAssertNil(incorrectPhoneNumber)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
