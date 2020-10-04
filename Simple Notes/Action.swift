//
//  Action.swift
//  Simple Notes
//
//  Created by Bohdan on 10/4/20.
//

import SwiftUI

enum Action {
  case addNote(_ note: Note)
  case startUpdatingNote(_ note: Note)
  case endUpdatingNote(_ note: Note?)
  case removeNote(_ note: IndexSet)
}
