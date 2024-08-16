//
//  NewTask.swift
//  ToDolist
//
//  Created by Armaan Khan  on 14/08/24.
//

import SwiftUI

struct NewTask: View {
    let listOfWork = ["Default","Personal", "Shopping", "WishList", "Work"]
    @State private var selectedList = "Default"
    @State private var newTask = ""
    @State private var dueDate = Date.now
    @State private var dueTime = Date.now
    
    var body: some View {
        NavigationStack {
            Form {
                Section("what is to be done ?") {
                    TextField("Enter Task Here", text: $newTask)
                }
                Section("Due date") {
                    DatePicker("", selection: $dueDate, displayedComponents: .date )
                        .labelsHidden()
                    DatePicker("", selection: $dueTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section("Add to List") {
                    
                    Picker("\(selectedList)", selection: $selectedList) {
                        ForEach(listOfWork, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("New Task")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NewTask()
}
