//
//  ContentView.swift
//  ToDolist
//
//  Created by Armaan Khan  on 14/08/24.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    
    @Query(sort: \Prospect.date) var prospects: [Prospect]
  
    @State private var rotationDegrees = 0.0
    @State private var showingSheet = false
    var body: some View {
        NavigationStack {
            List {
                VStack(alignment: .leading) {
                    ForEach(prospects) { prospect in
                        VStack(alignment: .leading) {
                            Text(prospect.task)
                                .font(.headline)
                            Text("Due date: \(prospect.date.formatted(date: .abbreviated, time: .omitted))")
                            Text("Time: \(prospect.time.formatted(date: .omitted, time: .shortened))")
                            Text("List: \(prospect.lists)")
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(radius: 2)
                    }
                }
                }
            }
           
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



#Preview {
    ContentView()
}
