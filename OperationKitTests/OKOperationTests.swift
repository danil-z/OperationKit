//
//  OperationKitTests.swift
//  OperationKitTests
//
//  Created by Danil Zvyagintsev on 9/19/16.
//  Copyright © 2016 Danil Zvyagintsev. All rights reserved.
//

import XCTest
@testable import OperationKit

class CounterOperation: XCTestOperation {
    var counter = 0
    
    override func execute() {
        counter += 1
        finish()
    }
}

class OperationKitTests: XCTestCase {
    
    let testQueue = OKOperationQueue()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExecuteFinishedOverrides() {
        let exp = expectation(description: "count increment")
        let op = CounterOperation(expectation: exp)
        testQueue.addOperation(op)
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(op.counter, 1)
    }
    
    
}
