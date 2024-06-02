//
//  ShoppingListView.swift
//  ShoppingListApp
//
//  Created by Mohamed Hassan on 01/06/2024.
//
import SwiftUI

struct ShoppingListView: View {
    @StateObject var viewModel = ShoppingListViewModel()
    @State private var showFilterActionSheet = false
    @State private var showSortActionSheet = false
    @State private var sortingFlag = false

    
    var body: some View {
        
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
            List {
                ForEach(viewModel.sortedAndFilteredItems) { item in
                    HStack {
                        Button(action: {
                            viewModel.toggleBoughtStatus(for: item)
                        }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name).font(.headline)
                                    Text("Quantity: \(item.quantity)").font(.subheadline)
                                    Text(item.description).font(.subheadline)
                                }
                                Spacer()
                                Image(systemName: item.isBought ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isBought ? .green : .red)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: EditItemView(viewModel: EditItemViewModel(item: item), mainViewModel: viewModel)) {
                            Image(systemName: "pencil")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteItem)
            } }
            .navigationTitle("Shopping List (\(viewModel.filter.rawValue))")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showFilterActionSheet.toggle()
                        sortingFlag = false
                    }) {
                        Text("Filter")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            showFilterActionSheet = true
                            sortingFlag = true
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                        }
                        NavigationLink(destination: AddItemView(viewModel: viewModel)) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .actionSheet(isPresented: $showFilterActionSheet) {
                if sortingFlag {
                    ActionSheet(
                        title: Text("Sort Items"),
                        buttons: [
                            .default(Text("Quantity Ascending")) { viewModel.sortOrder = .ascending },
                            .default(Text("Quantity Descending")) { viewModel.sortOrder = .descending },
                            .cancel()
                        ]
                    )
                } else {
                    ActionSheet(
                        title: Text("Filter Items"),
                        buttons: [
                            .default(Text("All")) { viewModel.filter = .all },
                            .default(Text("Bought")) { viewModel.filter = .bought },
                            .default(Text("Not Bought")) { viewModel.filter = .notBought },
                            .cancel()
                        ]
                    )
                }
                
            }

        }
    }
}
