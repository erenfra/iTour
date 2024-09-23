//
//  iTourApp.swift
//  iTour
//
//  Created by Renato Oliveira Fraga on 12/3/23.
//
import SwiftData
import SwiftUI

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Destination.self)
    }
}
