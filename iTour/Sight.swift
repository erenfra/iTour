//
//  Sight.swift
//  iTour
//
//  Created by Renato Oliveira Fraga on 9/23/24.
//

import Foundation
import SwiftData


@Model
class Sight {
  var name: String
  var destination: Destination?

  init(name: String) {
    self.name = name
  }
}
