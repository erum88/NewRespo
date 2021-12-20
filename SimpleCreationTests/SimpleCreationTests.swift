//
//  SimpleCreationTests.swift
//  SimpleCreationTests
//
//  Created by Erum on 20/12/21.
//

import XCTest
@testable import SimpleCreation

class SimpleCreationTests: XCTestCase {

    func testBaseAPIIsCorrect() {
        let baseURLString = BASE_URL
        let expectedBaseURLString = "https://picsum.photos/"
        XCTAssertEqual(baseURLString, expectedBaseURLString)
    }
    
    func testOtherApiCheck() {
        
    }

}

