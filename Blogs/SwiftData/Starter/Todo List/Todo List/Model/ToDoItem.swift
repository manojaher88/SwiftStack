//
//  Item.swift
//  Todo List
//
//  Created by SwiftStack on 08/07/23.
//

import Foundation

// MARK: - ToDoItem
final class ToDoItem: Identifiable {
    var title: String
    var timestamp: Date
    var isCompleted: Bool

    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en-US")
        return dateFormatter
    }()

    init(title: String, timestamp: Date, isCompleted: Bool) {
        self.title = title
        self.timestamp = timestamp
        self.isCompleted = isCompleted
    }

    func getFormattedDate()-> String {
        print(dateFormatter)
        return dateFormatter.string(from: timestamp)
    }
}

extension ToDoItem {
    static let toDoItems: [ToDoItem] = [ToDoItem(title: "Lets do the first item", timestamp: Date(), isCompleted: false),
                                        ToDoItem(title: "Lets do the second item", timestamp: Date(), isCompleted: false),
                                        ToDoItem(title: "Lets do the third item", timestamp: Date(), isCompleted: true)]
}
