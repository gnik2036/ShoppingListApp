//
//  ShoppingItem.swift
//  ShoppingListApp
//
//  Created by Mohamed Hassan on 01/06/2024.
//

import Foundation

struct ShoppingItem: Identifiable, Codable {
    let id: UUID
    var name: String
    var quantity: Int
    var description: String
    var isBought: Bool
    
    init(id: UUID = UUID(), name: String, quantity: Int, description: String, isBought: Bool = false) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.description = description
        self.isBought = isBought
    }
}
