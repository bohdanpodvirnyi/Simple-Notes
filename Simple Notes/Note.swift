//
//  Note.swift
//  Simple Notes
//
//  Created by Bohdan on 10/4/20.
//

import SwiftUI

struct Note: Identifiable {
  let id: UUID = .init()
  let createdAt: Date
  var updatedAt: Date
  var body: String = ""
  
  init(createdAt date: Date = Date(), with body: String = "") {
    self.createdAt = date
    self.updatedAt = date
    self.body = body
  }
  
  mutating func update(with text: String, at date: Date) {
    body = text
    updatedAt = date
  }
}
