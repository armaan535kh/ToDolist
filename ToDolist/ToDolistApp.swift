//
//  ToDolistApp.swift
//  ToDolist
//
//  Created by Armaan Khan  on 14/08/24.
//

import SwiftUI
import SwiftData

@main
struct ToDolistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Prospect.self])
    }
}
