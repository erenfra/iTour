//
//  EditDestinationView.swift
//  iTour
//
//  Created by Renato Oliveira Fraga on 9/17/24.
//
import SwiftData
import SwiftUI

struct EditDestinationView: View {
  @Bindable var destination: Destination
  @State private var newSightName: String = ""
  var body: some View {
    Form {
      TextField("Name", text: $destination.name)
      TextField("Details", text: $destination.details, axis: .vertical)
      DatePicker("Date", selection: $destination.date)
      
      Section("Priority") {
        Picker("Priority", selection: $destination.priority) {
          Text("Meh").tag(1)
          Text("Maybe").tag(2)
          Text("Must").tag(3)
        }.pickerStyle(.segmented)
      }
      Section("Sights") {
        ForEach(destination.sights) { sight in
          Text(sight.name)
        }
        HStack {
          TextField("Add a new sight in \(destination.name)", text: $newSightName)
          Button(action: addSight) {
            Text("Add")
          }
        }
      }
    }.navigationTitle("Edit Destination")
      .navigationBarTitleDisplayMode(.inline)
  }

  func addSight() {
    guard !newSightName.isEmpty else { return }

    withAnimation {
      destination.sights.append(Sight(name: newSightName))
      newSightName = ""
    }

  }

}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Destination.self, configurations: config)
    let example = Destination(name: "Example Destination", details: "This is an example destination to be showed in the preview", date: .now, priority: 3)
    return EditDestinationView(destination: example)
      .modelContainer(container)
  } catch {
    fatalError("Failed to create model container")
  }
}
