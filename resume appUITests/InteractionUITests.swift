//
//  InteractionUITests.swift
//  resume appUITests
//
//  Created by Carlos Vázquez Gómez on 5/26/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import XCTest

// MARK: - InteractionUITests class
class InteractionUITests: XCTestCase {
    
    // MARK: - Attributes
    var app: XCUIApplication!
    
    // MARK: - Superclass functions
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

    // MARK: - Test cases
    func testInteractionOptionsInMainView() {
        let tablesQuery = app.tables
        let firstCell = tablesQuery.cells.allElementsBoundByIndex[0]
        let secondCell = tablesQuery.cells.allElementsBoundByIndex[1]
        let thirdCell = tablesQuery.cells.allElementsBoundByIndex[2]
        let exists = NSPredicate(format: "exists == 1")
        
        XCTAssert(firstCell.exists && secondCell.exists && thirdCell.exists)
        
        firstCell.swipeUp()
        firstCell.swipeDown()
        
        expectation(for: exists, evaluatedWith: firstCell, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        secondCell.tap()
        app.navigationBars["Recent projects"].buttons["Profile"].tap()
        
        expectation(for: exists, evaluatedWith: secondCell, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        thirdCell.tap()
        tablesQuery.cells.allElementsBoundByIndex[0].swipeUp()
        let middleCellIndex = tablesQuery.cells.allElementsBoundByIndex.endIndex / 2
        tablesQuery.cells.allElementsBoundByIndex[middleCellIndex].swipeDown()
        app.navigationBars["Experience"].buttons["Profile"].tap()
        
        XCTAssert(firstCell.exists && secondCell.exists && thirdCell.exists)
    }
}
