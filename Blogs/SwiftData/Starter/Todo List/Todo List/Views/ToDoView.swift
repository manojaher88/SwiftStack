//
//  ToDoView.swift
//  Todo List
//
//  Created by SwiftStack on 08/07/23.
//

import SwiftUI

// MARK: - ToDoItemsViewModel
final class ToDoItemsViewModel: ObservableObject {
    @Published var items: [ToDoItem]

    init(items: [ToDoItem]) {
        self.items = items
    }
}

// MARK: - ToDoView
struct ToDoView: View {
    @ObservedObject var viewModel: ToDoItemsViewModel
    @State var isPresented: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<viewModel.items.count, id:\.self) { index in
                    let item = viewModel.items[index]
                    HStack {
                        Checkbox(isPressed: Binding(get: {
                            item.isCompleted
                        }, set: { newValue in
                            item.isCompleted = newValue
                            viewModel.items.remove(at: index)
                            viewModel.items.insert(item, at: index)
                        }))
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.title3)
                            Text(item.getFormattedDate())
                                .font(.subheadline)
                        }
                    }
                    .onTapGesture {
                        item.isCompleted.toggle()
                        viewModel.items.remove(at: index)
                        viewModel.items.insert(item, at: index)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.items.remove(at: index)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }

                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        Label("Add", systemImage: "plus")
                    })
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("ToDo App")
            .sheet(isPresented: $isPresented, content: {
                NavigationStack {
                    CreateToDoItem(isPresented: $isPresented) { todoItem in
                        viewModel.items.append(todoItem)
                    }
                }
                .presentationDetents([.medium])
            })
        }
        .overlay(content: {
            if viewModel.items.isEmpty {
                ContentUnavailableView {
                    Label("No items to show", systemImage: "xmark.circle")
                } description: {
                    Text("Lets create new by tapping on + icon on top right")
                }
            }
        })
    }
}

#Preview {
    let toDoItems: [ToDoItem] = [ToDoItem(title: "Lets do the first item", timestamp: Date(), isCompleted: false),
                                 ToDoItem(title: "Lets do the second item", timestamp: Date(), isCompleted: false),
                                 ToDoItem(title: "Lets do the third item", timestamp: Date(), isCompleted: true)]
    return ToDoView(viewModel: ToDoItemsViewModel(items: toDoItems))
}
