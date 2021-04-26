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


    
    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Login"].tap()
        //app.buttons["Back"].tap()
        //app.buttons["Register"].tap()
        let testEmail = app.otherElements.textFields["Username"]
        let testPass = app.otherElements.secureTextFields["Password"]
        testEmail.tap()
        testEmail.typeText("1@2.com")
        testPass.tap()
        testPass.typeText("123456")
        app.buttons["Login"].tap()
    }
    
    

    

        

        
    //have to be logged in already
        func testExpiry() throws {
            let app = XCUIApplication()
            app.tabBars.buttons["Expiry"].tap()
            app.navigationBars["Reminders"].buttons["Add"].tap()
            app.searchFields["Enter Product"].tap()
                   
                //let app = app2
            app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                   
            let vKey = app/*@START_MENU_TOKEN@*/.keys["v"]/*[[".keyboards.keys[\"v\"]",".keys[\"v\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                   vKey.tap()
                   
                   let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                   oKey.tap()
                   
                   let cKey = app/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                   cKey.tap()
                   
                   let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                   aKey.tap()
                   
                   let dKey = app/*@START_MENU_TOKEN@*/.keys["d"]/*[[".keyboards.keys[\"d\"]",".keys[\"d\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                   dKey.tap()
            
            app/*@START_MENU_TOKEN@*/.tables.staticTexts["Avocado"]/*[[".otherElements[\"drop_down\"].tables",".cells.staticTexts[\"Avocado\"]",".staticTexts[\"Avocado\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
            app.textFields["Enter Quantity"].tap()
            app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
            
            let key = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key.tap()
            app.navigationBars["New Reminder"].buttons["Save"].tap()
            
            
        }
        

        func testSaveBudget() throws{
            let app = XCUIApplication()
            
            app.tabBars.buttons["Budget"].tap()
            app.textFields["$0.00"].tap()
            
            let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key.tap()
            
            let key2 = app/*@START_MENU_TOKEN@*/.keys["0"]/*[[".keyboards.keys[\"0\"]",".keys[\"0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key2.tap()
            key2.tap()
            
            app/*@START_MENU_TOKEN@*/.staticTexts["Allowance"]/*[[".buttons[\"Allowance\"].staticTexts[\"Allowance\"]",".staticTexts[\"Allowance\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            app/*@START_MENU_TOKEN@*/.staticTexts["+"]/*[[".buttons[\"+\"].staticTexts[\"+\"]",".staticTexts[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            app.textFields["Enter Product Name"].tap()
            
            let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            aKey.tap()
            
            let pKey = app/*@START_MENU_TOKEN@*/.keys["p"]/*[[".keyboards.keys[\"p\"]",".keys[\"p\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            pKey.tap()
            pKey.tap()
            
            let lKey = app/*@START_MENU_TOKEN@*/.keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            lKey.tap()
            
            let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            eKey.tap()
            
            app.textFields["Enter Price"].tap()
            
            let key3 = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            key3.tap()
            app.navigationBars["New Budget"].buttons["Save"].tap()

            
        }
        
        func testRecipe() throws{
            let app = XCUIApplication()
            app.launch()
            app.tabBars["Tab Bar"].buttons["Recipe"].tap()
            app.tables["Empty list"].children(matching: .searchField).element.tap()
            app.typeText("Ranch")
            app.buttons["Search"].tap()
            app.tables/*@START_MENU_TOKEN@*/.staticTexts["Chicken Ranch Burgers"]/*[[".cells.staticTexts[\"Chicken Ranch Burgers\"]",".staticTexts[\"Chicken Ranch Burgers\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            
            app.scrollViews.children(matching: .textView).element.swipeUp()
            app/*@START_MENU_TOKEN@*/.textViews/*[[".scrollViews.textViews",".textViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.textViews["Step 4: Scoop and make 3 large burger patties."].tap()
            
            app.buttons["Recipes"].tap()
            
            
            
            
            
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

    

    

