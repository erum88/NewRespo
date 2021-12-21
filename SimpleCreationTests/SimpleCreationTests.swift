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
    
    func testImagegetApiCheck() {
        
        let expectation = self.expectation(description: "ImagegetApiCheck")
        
        API.getImageListAPI{ (result, error) in
            
            XCTAssertNotNil(result)
            
            expectation.fulfill()
        }
      waitForExpectations(timeout: 10, handler: nil)
        
        
    }

}

