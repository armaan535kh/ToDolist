//
//  ContentView.swift
//  ToDolist
//
//  Created by Armaan Khan  on 14/08/24.
//

import SwiftUI



struct ContentView: View {
  
    @State private var rotationDegrees = 0.0
    @State private var showingSheet = false
    var body: some View {
        NavigationStack {
            Spacer()
            HStack {
                Button(action: {
                    showingSheet.toggle()
                    withAnimation{
                        
                        rotationDegrees += 360
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.all, 5)
                        .background(Color.blue)
                        .cornerRadius(50)
                                                .rotationEffect(.degrees(rotationDegrees))
                    
                }
                .sheet(isPresented: $showingSheet) {
                    NewTask()
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}


#Preview {
    ContentView()
}
