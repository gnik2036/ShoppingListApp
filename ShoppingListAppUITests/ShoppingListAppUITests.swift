//
//  ShoppingListAppUITests.swift
//  ShoppingListAppUITests
//
//  Created by Mohamed Hassan on 30/05/2024.
//
// Tests/ShoppingListAppUITests.swift
import XCTest

class ShoppingListAppUITests: XCTestCase {
    func testAddItem() {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Add"].tap()
        
        let itemNameField = app.textFields["Item Name"]
        itemNameField.tap()
        itemNameField.typeText("Butter")
        
        let quantityField = app.textFields["Quantity"]
        quantityField.tap()
        quantityField.typeText("1")
        
        let descriptionField = app.textFields["Description"]
        descriptionField.tap()
        descriptionField.typeText("Salted Butter")
        
        app.buttons["Add Item"].tap()
        
        XCTAssertTrue(app.staticTexts["Butter"].exists)
    }
}
