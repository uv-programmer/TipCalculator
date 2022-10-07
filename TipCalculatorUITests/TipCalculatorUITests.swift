//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by VIshnu Unnikrishnan  on 06/10/22.
//

import XCTest

class when_the_content_view_is_shown : XCTestCase {

    func test_should_make_sure_that_total_textfield_contains_default_value(){
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = app.textFields["totalTextField"]
        XCTAssertEqual(totalTextField.value as!String,"Enter total")
    }
    
    func test_should_make_sure_the_20_percent_default_tip_selected () {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let tipPercentageSegmentControl =  app.segmentedControls["tipPercntageSegmentedControl"]
        let segmentedControlButton = tipPercentageSegmentControl.buttons.element(boundBy: 1)
        XCTAssertEqual(segmentedControlButton.label, "20%")
        XCTAssertTrue(segmentedControlButton.isSelected)
    }
}
