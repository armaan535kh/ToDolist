//
//  NewTask.swift
//  ToDolist
//
//  Created by Armaan Khan  on 14/08/24.
//

import SwiftUI
import SwiftData


struct NewTask: View {
    
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    let listOfWork = ["Default","Personal", "Shopping", "WishList", "Work"]
    @State private var selectedList = "Default"
    @State private var newTask = ""
    @State private var dueDate = Date.now
    @State private var dueTime = Date.now
    @State private var isTime = false
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("what is to be done ?") {
                    TextField("Enter Task Here", text: $newTask)
                }
                Section("Due date") {
                    DatePicker("", selection: $dueDate, displayedComponents: .date )
                        .labelsHidden()
                    Toggle("Set a time", isOn: $isTime)
                    if isTime {
                        DatePicker("", selection: $dueTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
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
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {dismiss() }
                }
                
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Save") {
                        let prospect = Prospect(task: newTask, date: dueDate, time: dueTime, lists: selectedList)
                        context.insert(prospect)
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NewTask()
}
