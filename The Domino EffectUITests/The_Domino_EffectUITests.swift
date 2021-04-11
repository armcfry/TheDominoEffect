//
//  The_Domino_EffectUITests.swift
//  The Domino EffectUITests
//
//  Created by Adam McFry on 4/5/21.
//  Copyright © 2021 Adam McFry. All rights reserved.
//

import XCTest

class The_Domino_EffectUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /**
     Opens help menu and verifies that the appropriate elements are present.
     */
    func testHelp() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.buttons["help"].exists)
        app.buttons["help"].tap()
        XCTAssertEqual(3, app.staticTexts.count)
        XCTAssertTrue(app.buttons["Dismiss"].exists)
        XCTAssertTrue(app.staticTexts["About"].exists)
        XCTAssertTrue(app.staticTexts["Feedback"].exists)
        app.buttons["Dismiss"].tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 14.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    

}
