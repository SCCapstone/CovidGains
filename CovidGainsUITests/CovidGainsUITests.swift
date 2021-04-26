//
//  CovidGainsUITests.swift
//  CovidGainsUITests
//
//  Created by KIM, JEEJUN on 1/20/21.
//

import XCTest
import CovidGains

var app: XCUIApplication!

class CovidGainsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRegister() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.buttons["Register"].tap()
        //app.buttons["Back"].tap()
        //app.buttons["Register"].tap()
        let testingUser = app.otherElements.textFields["Username"]
        let testingPass = app.otherElements.secureTextFields["Password"]
        testingUser.tap()
        testingUser.typeText("UITest")
        testingPass.tap()
        testingPass.typeText("UITest")
        app.buttons["Register"].tap()
        
        
        //app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
