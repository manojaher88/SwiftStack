//
//  Checkbox.swift
//  Todo List
//
//  Created by SwiftStack on 08/07/23.
//

import SwiftUI

struct Checkbox: View {
    @Binding var isPressed: Bool
    var width: CGFloat = 50

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.alabaster)
                .stroke(Color.alto, lineWidth: 2)
                .onTapGesture {
                    isPressed.toggle()
                }
            if isPressed {
                Image(systemName: "checkmark")
                    .font(.title3)
                    .symbolEffect(.bounce, options: .speed(2), value: isPressed)
            }
        }
        .padding(8)
        .frame(width: width, height: width)
    }
}

#Preview {
    @State var isPressed: Bool = false
    return Checkbox(isPressed: $isPressed, width: 50)
}
