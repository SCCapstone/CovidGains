//
//  CovidGainsUITests.swift
//  CovidGainsUITests
//
//  Created by KIM, JEEJUN on 1/20/21.
//

import XCTest
import CovidGains
import Firebase

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
    
    
    
    
    func testExpiryRemove() throws {
        XCUIApplication().tabBars.buttons["Expiry"].tap()
        

        app.tabBars.buttons["Expiry"].tap()
        app.navigationBars["Reminders"].buttons["Add"].tap()
        app.searchFields["Enter Product"].tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.tables.staticTexts["Custard-apple"]/*[[".otherElements[\"drop_down\"].tables",".cells.staticTexts[\"Custard-apple\"]",".staticTexts[\"Custard-apple\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        
        let enterQuantityTextField = app.textFields["Enter Quantity"]
        enterQuantityTextField.tap()
        enterQuantityTextField.tap()
        app2.datePickers/*@START_MENU_TOKEN@*/.pickerWheels["Today"]/*[[".pickers.pickerWheels[\"Today\"]",".pickerWheels[\"Today\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        app.navigationBars["New Reminder"].buttons["Save"].tap()
            
                        
        
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
