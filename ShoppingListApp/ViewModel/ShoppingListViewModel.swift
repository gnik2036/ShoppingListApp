////
////  ShoppingListViewModel.swift
////  ShoppingListApp
////
////  Created by Mohamed Hassan on 01/06/2024.
////
//import Foundation
//import Combine

import Foundation
import Combine

class ShoppingListViewModel: ObservableObject {
    @Published var items: [ShoppingItem] = []
    @Published var filter: ItemFilter = .all
    @Published var sortOrder: SortOrder = .ascending
    @Published var searchText: String = ""

    var sortedAndFilteredItems: [ShoppingItem] {
        let filteredItems: [ShoppingItem]

        switch filter {
        case .all:
            filteredItems = items
        case .bought:
            filteredItems = items.filter { $0.isBought }
        case .notBought:
            filteredItems = items.filter { !$0.isBought }
        }

        let searchedItems = searchText.isEmpty ? filteredItems : filteredItems.filter {
            $0.name.lowercased().contains(searchText.lowercased()) || $0.description.lowercased().contains(searchText.lowercased())
        }

        switch sortOrder {
        case .ascending:
            return searchedItems.sorted { $0.quantity < $1.quantity }
        case .descending:
            return searchedItems.sorted { $0.quantity > $1.quantity }
        }
    }

    func addItem(item: ShoppingItem) {
        items.append(item)
    }

    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func toggleBoughtStatus(for item: ShoppingItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isBought.toggle()
        }
    }

    func updateItem(updatedItem: ShoppingItem) {
        if let index = items.firstIndex(where: { $0.id == updatedItem.id }) {
            items[index] = updatedItem
        }
    }
}

enum ItemFilter: String {
    case all = "All"
    case bought = "Bought"
    case notBought = "Not Bought"
}

enum SortOrder {
    case ascending, descending
}
