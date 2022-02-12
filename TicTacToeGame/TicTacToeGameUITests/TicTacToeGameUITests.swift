//
//  TicTacToeGameUITests.swift
//  TicTacToeGameUITests
//
//  Created by NextAuth on 12/02/2022.
//

import XCTest

class TicTacToeGameUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testWinCrossHorizontal() throws {
        
        let app = XCUIApplication()
        app.launch()
        let element3 = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element3.children(matching: .other).element(boundBy: 0)
        element.children(matching: .button).element(boundBy: 0).tap()
        
        let element2 = element3.children(matching: .other).element(boundBy: 1)
        element2.children(matching: .button).element(boundBy: 0).tap()
        element.children(matching: .button).element(boundBy: 1).tap()
        element2.children(matching: .button).element(boundBy: 1).tap()
        element.children(matching: .button).element(boundBy: 2).tap()
        app.alerts["Crosses Win!"].scrollViews.otherElements.buttons["Reset"].tap()
        
    }
    
    func testCrossWin() throws {
        let app = XCUIApplication()
        app.launch()
        let element2 = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element(boundBy: 1)
        element.children(matching: .button).element(boundBy: 0).tap()
        element2.children(matching: .other).element(boundBy: 0).children(matching: .button).element(boundBy: 1).tap()
        element.children(matching: .button).element(boundBy: 1).tap()
        element2.children(matching: .other).element(boundBy: 2).children(matching: .button).element(boundBy: 0).tap()
        element.children(matching: .button).element(boundBy: 2).tap()
        app.alerts["Crosses Win!"].scrollViews.otherElements.buttons["Reset"].tap()
    }

    func testDignal() throws {
        
        let app = XCUIApplication()
        app.launch()
        let element3 = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element3.children(matching: .other).element(boundBy: 0)
        element.children(matching: .button).element(boundBy: 2).tap()
        element.children(matching: .button).element(boundBy: 0).tap()
        
        let element2 = element3.children(matching: .other).element(boundBy: 1)
        element2.children(matching: .button).element(boundBy: 1).tap()
        element2.children(matching: .button).element(boundBy: 2).tap()
        element3.children(matching: .other).element(boundBy: 2).children(matching: .button).element(boundBy: 0).tap()
        app.alerts["Crosses Win!"].scrollViews.otherElements.buttons["Reset"].tap()
                
    }
    
    func testCrossVertical() throws {
        
        let app = XCUIApplication()
        app.launch()
        let element3 = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element3.children(matching: .other).element(boundBy: 0)
        element.children(matching: .button).element(boundBy: 0).tap()
        element.children(matching: .button).element(boundBy: 1).tap()
        
        let element2 = element3.children(matching: .other).element(boundBy: 1)
        element2.children(matching: .button).element(boundBy: 0).tap()
        element2.children(matching: .button).element(boundBy: 1).tap()
        element3.children(matching: .other).element(boundBy: 2).children(matching: .button).element(boundBy: 0).tap()
        app.alerts["Crosses Win!"].scrollViews.otherElements.buttons["Reset"].tap()
        
    }
    
}
