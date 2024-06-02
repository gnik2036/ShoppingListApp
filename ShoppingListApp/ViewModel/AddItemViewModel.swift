//
//  AddItemViewModel.swift
//  ShoppingListApp
//
//  Created by Mohamed Hassan on 01/06/2024.
//
import Foundation

class AddItemViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var quantity: Int = 1
    @Published var description: String = ""
    
    func createItem() -> ShoppingItem {
        ShoppingItem(name: name, quantity: quantity, description: description)
    }
}
