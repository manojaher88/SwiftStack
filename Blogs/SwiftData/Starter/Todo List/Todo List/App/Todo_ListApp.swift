//
//  Todo_ListApp.swift
//  Todo List
//
//  Created by SwiftStack on 08/07/23.
//

import SwiftUI
import SwiftData

@main
struct Todo_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoView(viewModel: ToDoItemsViewModel(items: []))
        }
    }
}
