//
//  Experiment.swift
//  ToDolist
//
//  Created by Armaan Khan  on 15/08/24.
//

import SwiftUI




struct Experiment: View {
    @State private var showingSheet = false
  
    
    var body: some View {
        Button("Showing sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            NewTask()
        }
        
       
    }
    
}

#Preview {
    Experiment()
}
