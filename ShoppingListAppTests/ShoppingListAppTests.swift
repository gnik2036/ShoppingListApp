//
//  ShoppingListAppTests.swift
//  ShoppingListAppTests
//
//  Created by Mohamed Hassan on 30/05/2024.
//
// Tests/ShoppingListViewModelTests.swift
import XCTest
@testable import ShoppingListApp

class ShoppingListViewModelTests: XCTestCase {
    var viewModel: ShoppingListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ShoppingListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testAddItem() {
        let item = ShoppingItem(name: "Milk", quantity: 2, description: "2 liters of milk")
        viewModel.addItem(item: item)
        XCTAssertTrue(viewModel.items.contains(where: { $0.id == item.id }))
    }

    func testDeleteItem() {
        let item = ShoppingItem(name: "Bread", quantity: 1, description: "Whole grain bread")
        viewModel.addItem(item: item)
        viewModel.deleteItem(at: IndexSet(integer: 0))
        XCTAssertFalse(viewModel.items.contains(where: { $0.id == item.id }))
    }

    func testToggleBoughtStatus() {
        let item = ShoppingItem(name: "Eggs", quantity: 12, description: "A dozen eggs")
        viewModel.addItem(item: item)
        viewModel.toggleBoughtStatus(for: item)
        XCTAssertTrue(viewModel.items.first?.isBought ?? false)
    }
}
