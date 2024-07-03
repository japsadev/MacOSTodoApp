//
//  ToDoItem.swift
//  ExampleMacosMenuBarApp
//
//  Created by japsa on 3.07.2024.
//

import Foundation

struct ToDoItem: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}
