//
//  Destination.swift
//  iTour
//
//  Created by Renato Oliveira Fraga on 9/17/24.
//
import SwiftData
import Foundation


@Model
class Destination {
  var name: String
  var details: String
  var date: Date
  var priority: Int
  @Relationship(deleteRule: .cascade, inverse: \Sight.destination) var sights = [Sight]()

  init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
    self.name = name
    self.details = details
    self.date = date
    self.priority = priority
  }
}
