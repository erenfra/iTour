//
//  ContentView.swift
//  iTour
//
//  Created by Renato Oliveira Fraga on 12/3/23.
//
import SwiftData
import SwiftUI

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query(sort: \Destination.name) var destinations: [Destination]
  @State private var path = [Destination]()
  
  var body: some View {
    NavigationStack(path: $path) {
      List {
        ForEach(destinations) { destination in
          NavigationLink(value: destination) {
            HStack {
              VStack(alignment: . leading) {
                Text(destination.name)
                  .font(.headline)
                Text(destination.date.formatted(date: .long, time: .shortened))
              }
              Spacer()
              Text("\(destination.sights.count)")
            }
          }
        }.onDelete(perform: deleteDestination)
      }.navigationTitle("iTour")
        .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
        .toolbar {
          Button("Add Destination", systemImage: "plus",action: addDestination)
        }
    }
  }
  
  func addDestination() {
    let destination = Destination()
    modelContext.insert(destination)
    path = [destination]
  }
  
  func deleteDestination(_ indexSet: IndexSet) {
    for index in indexSet {
      let destination = destinations[index]
      modelContext.delete(destination)
    }
  }
}

#Preview {
  ContentView()
}
