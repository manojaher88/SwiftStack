//
//  CreateToDoItem.swift
//  Todo List
//
//  Created by SwiftStack on 08/07/23.
//

import SwiftUI

struct CreateToDoItem: View {
    @Binding var isPresented: Bool
    @State var text: String = ""
    @State private var showingAlert: Bool = false

    var itemAdded: ((_ todoItem: ToDoItem)-> Void)?

    var body: some View {
        VStack {
            HStack {
                Text("Add Task")
                    .font(.title)
                Spacer()
                Button("Done") {
                    guard !text.isEmpty else {
                        showingAlert.toggle()
                        return
                    }
                    let item = ToDoItem(title: text, timestamp: Date(),
                                        isCompleted: false)
                    itemAdded?(item)
                    isPresented.toggle()
                }
                .buttonStyle(.bordered)
                .alert("Please add to create task", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
            }

            TextEditor(text: $text)
                .padding(8)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.alabaster, lineWidth: 2))
                .frame(height: 200)
            Spacer()
        }
        .padding(32)
    }
}

#Preview {
    CreateToDoItem(isPresented: .constant(false))
}
