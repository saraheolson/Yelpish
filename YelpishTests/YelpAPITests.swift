//
//  YelpAPITests.swift
//  YelpishUITests
//
//  Created by Sarah Olson on 9/4/24.
//

import XCTest

final class YelpAPITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // I wouldn't use a test like this in a Production app, but it's useful for testing when
    // writing the API
    func testSearch() throws {
        let completionExpectation = expectation(description: "Wait for API call to finish")
        YelpAPI().search(forTerm: "new york") { businesses, error in
            XCTAssertNil(error)
            XCTAssertNotNil(businesses)
            if let businesses = businesses {
                XCTAssert(businesses.count > 0)
            } else {
                XCTFail()
            }
            completionExpectation.fulfill()
        }
        waitForExpectations(timeout: 40, handler: nil)
    }
    
    func testGetBusinessDetails() throws {
        let completionExpectation = expectation(description: "Wait for API call to finish")
        YelpAPI().getBusinessDetails(withId: "-OixbLnFLCzQclxCSbUQ8w") { business, error in
            XCTAssertNil(error)
            XCTAssertNotNil(business)
            if let business = business {
                XCTAssert(business.id == "-OixbLnFLCzQclxCSbUQ8w")
            } else {
                XCTFail()
            }
            completionExpectation.fulfill()
        }
        waitForExpectations(timeout: 40, handler: nil)
    }
}
