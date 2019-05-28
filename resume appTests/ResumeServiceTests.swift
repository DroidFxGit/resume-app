//
//  ResumeServiceTests.swift
//  resume appTests
//
//  Created by Carlos Vázquez Gómez on 5/26/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import XCTest
@testable import resume_app

// MARK: - ResumeServiceTests class
class ResumeServiceTests: XCTestCase {

    // MARK: - Attributes
    var service: MockResumeService!
    var exp: XCTestExpectation!
    
    // MARK: - Superclass functions
    override func setUp() {
        service = MockResumeService()
    }

    override func tearDown() {
        service = nil
    }

    // MARK: - Test cases
    func testThatResumeServiceResponseIsSatisfactory() {
        let exp = expectation(description: "Resume Response expectation")
        service.shouldShowError = false

        service.fetchMainInfo { response in
            switch response {
            case .success(let response):
                XCTAssertNotNil(response)
                exp.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

    func testThatResumeServiceShowsError() {
        let exp = expectation(description: "Bad Resume Response expectation")
        service.shouldShowError = true

        service.fetchMainInfo { response in
            switch response {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertNotNil(error)
                exp.fulfill()
            }
        }
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testThatBaseServiceCanParseData() {
        let mockData = MockData.mockJSON
        let baseService = BaseService<MockCodableObject>()
        
        do {
            let object = try baseService.parse(data: mockData)
            XCTAssertNotNil(object)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }

}
