//
//  EditItemView.swift
//  ShoppingListApp
//
//  Created by Mohamed Hassan on 01/06/2024.
//
import SwiftUI

struct EditItemView: View {
    @ObservedObject var viewModel: EditItemViewModel
    @ObservedObject var mainViewModel: ShoppingListViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            TextField("Item Name", text: $viewModel.item.name)
            TextField("Quantity", value: $viewModel.item.quantity, formatter: NumberFormatter())
            TextField("Description", text: $viewModel.item.description)
            
            Button("Save Changes") {
                mainViewModel.updateItem(updatedItem: viewModel.item)
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Edit Item")
    }
}
