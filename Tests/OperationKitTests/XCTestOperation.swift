//
//  XCTestOperation.swift
//  OperationKit
//
//  Created by Danil Zvyagintsev on 9/19/16.
//  Copyright © 2016 Danil Zvyagintsev. All rights reserved.
//

import XCTest
@testable import OperationKit

class XCTestOperation: OKOperation {
    let expectation:XCTestExpectation?
    
    init(expectation:XCTestExpectation? = nil) {
        self.expectation = expectation
        super.init()
    }
    
    override func execute() {
        finish()
    }

    override func finished(_ errors: [NSError]) {
        if errors.count == 0{
            expectation?.fulfill()
        }
    }
}
