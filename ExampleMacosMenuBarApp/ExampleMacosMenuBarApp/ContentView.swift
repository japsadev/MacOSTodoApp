//
//  ContentView.swift
//  ExampleMacosMenuBarApp
//
//  Created by japsa on 3.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [ToDoItem] = []
    @State private var newItemTitle: String = ""

    var body: some View {
        VStack {
            HStack {
                TextField("New Task", text: $newItemTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addItem) {
                    Text("Add")
                        .padding(.horizontal)
                        .padding(.vertical, 6)
//                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()

            List {
                ForEach($items) { $item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        Button(action: {
                            item.isCompleted.toggle()
                        }) {
                            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(item.isCompleted ? .green : .gray)
                        }
                    }
                }
                .onDelete(perform: deleteItem)
            }
        }
        .padding()
    }

    private func addItem() {
        if !newItemTitle.isEmpty {
            let newItem = ToDoItem(title: newItemTitle)
            items.append(newItem)
            newItemTitle = ""
        }
    }

    private func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
