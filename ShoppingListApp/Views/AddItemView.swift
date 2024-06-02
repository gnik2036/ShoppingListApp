//
//  AddItemView.swift
//  ShoppingListApp
//
//  Created by Mohamed Hassan on 01/06/2024.
//
import SwiftUI

struct AddItemView: View {
    @StateObject var addItemViewModel = AddItemViewModel()
    @ObservedObject var viewModel: ShoppingListViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            TextField("Item Name", text: $addItemViewModel.name)
            TextField("Quantity", value: $addItemViewModel.quantity, formatter: NumberFormatter())
            TextField("Description", text: $addItemViewModel.description)
            
            Button("Add Item") {
                viewModel.addItem(item: addItemViewModel.createItem())
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Add Item")
    }
}
