//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by VIshnu Unnikrishnan  on 06/10/22.
//

import XCTest

class when_the_content_view_is_shown : XCTestCase {
    
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    override func setUp()   {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }

    func test_should_make_sure_that_total_textfield_contains_default_value(){
        XCTAssertEqual(contentViewPage.totalTextField.value as!String,"Enter total")
    }
    
    func test_should_make_sure_the_20_percent_default_tip_selected () {
        let segmentedControlButton = contentViewPage.tipPercentageSegmentedControl.buttons.element(boundBy: 1)
        XCTAssertEqual(segmentedControlButton.label, "20%")
        XCTAssertTrue(segmentedControlButton.isSelected)
    }
    
    override func tearDown()   {
        //clean up
    }

}

class when_calculate_tip_button_is_pressed_for_valid_input: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!

    override func setUp()   {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = contentViewPage.totalTextField
        totalTextField.tap()
        totalTextField.typeText("100")
        
        let calculateTipButton = contentViewPage.calculateTipButton
        calculateTipButton.tap()
        
    }
    
    func test_should_make_sure_that_tip_is_displayed_on_the_screen() {
        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipText.label, "$20.00")
    }
    

}


class when_calculate_tip_button_is_pressed_for_invalid_input: XCTestCase {

    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    override func setUp()   {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = contentViewPage.totalTextField
        totalTextField.tap()
        totalTextField.typeText("-100")
        
        let calculateTipButton = app.buttons["calculateTipButton"]
        calculateTipButton.tap()
        
    }
    
    func test_should_clear_tip_label_for_invalid_innput() {
        
        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipText.label, "")
        
    }
    
    func test_should_display_error_message_for_invalid_input() {
       
        let messageText = contentViewPage.messageText
        let _ = messageText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(messageText.label, "Invalid Input")
        
    }

}
