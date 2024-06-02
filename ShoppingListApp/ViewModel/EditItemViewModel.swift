//
//  EditItemViewModel.swift
//  ShoppingListApp
//
//  Created by Mohamed Hassan on 01/06/2024.
//
import Foundation

class EditItemViewModel: ObservableObject {
    @Published var item: ShoppingItem
    
    init(item: ShoppingItem) {
        self.item = item
    }
    
    func updateItem() {
        // Update the item, perhaps using a service or notifying a view model
    }
}
