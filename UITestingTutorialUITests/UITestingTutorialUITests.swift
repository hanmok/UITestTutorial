//
//  UITestingTutorialUITests.swift
//  UITestingTutorialUITests
//
//  Created by 핏투비 on 2022/08/01.
//  Copyright © 2022 Code Pro. All rights reserved.
//

import XCTest

class UITestingTutorialUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
        continueAfterFailure = true

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testInvalidLogin_progressSpinnerIsHidden() {
        
//        let validPassword = "invalidPassword"
//        let validUserName = "CodePro"
        
        
        let app = XCUIApplication()
        app.launch()
        
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        app.buttons["Login"].tap()
        app.buttons["Login"].tap() // 하나만 쓰면 이상하게 버그남;;
//        app.alerts["Missing Credentials"].scrollViews.otherElements.buttons["Ok"].tap()
        let alertDialog = app.alerts["Missing Credentials"]
//        XCTAssertTrue(alertDialog.exists)
//        alertDialog.buttons["Ok"].tap()
        XCTAssertTrue(alertDialog.buttons["Ok"].exists)

        let activityIndicatorView = app.activityIndicators["In progress"]
                
        XCTAssertFalse(activityIndicatorView.exists)
        
    }
    
    func test_something() {
        
        let app = XCUIApplication()
        app.textFields["Username"].tap()
        app.secureTextFields["Password"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Missing Credentials"].scrollViews.otherElements.buttons["Ok"].tap()
                
    }
    
    func testInvalidLogin_missingCredentialsAlertIsShown() {
        
        let app = XCUIApplication()
        app.launch()
        
        
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        
        app.textFields["Username"].tap()
//        app.secureTextFields["Password"].tap()
//        app/*@START_MENU_TOKEN@*/.buttons["Login"].staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Login"].tap()
//        app.alerts["Invalid Credentials"].scrollViews.otherElements.buttons["Ok"].tap()
        
        
        
//        let app = XCUIApplication()
//        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        let alertDialog = app.alerts["Missing Credentials"].scrollViews.otherElements.buttons["Ok"].tap()
        
        let alertDialog = app.alerts["Missing Credentials"]
        XCTAssertTrue(alertDialog.exists)
        
        alertDialog.buttons["Ok"].tap()
        
    }
    
    func testValidLoginSuccess() {
        XCUIApplication().launch()
        let validPassword = "abc123"
        let validUserName = "CodePro"
        
        let app = XCUIApplication()
        
//        let loginToMockifyStaticText = app.navigationBars["Login To Mockify"].staticTexts["Login To Mockify"]
        
//        loginToMockifyStaticText.swipeDown()
//        loginToMockifyStaticText.swipeDown()
        
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
        
        let usernameTextField = app.textFields["Username"]
        XCTAssertTrue(usernameTextField.exists)
        
        usernameTextField.tap()
        
        usernameTextField.typeText(validUserName)
        
        let passwordTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        
        passwordTextField.tap()
        passwordTextField.typeText(validPassword)
        
        app.buttons["Login"].tap()
        
        let downloadsCell = app.tables.staticTexts["My Downloads"]
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: downloadsCell, handler: nil)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(downloadsCell.exists)
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                                XCUIApplication().launch()
            }
        }
    }
}
