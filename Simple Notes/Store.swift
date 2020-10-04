//
//  Store.swift
//  Simple Notes
//
//  Created by Bohdan on 10/4/20.
//

import SwiftUI

final class Store: ObservableObject {
  
  @Published private(set) var state: AppState
  
  init(state: AppState = AppState(notes: [])) {
    self.state = state
  }
  
  public func dispatch(action: Action) {
    state = reducer(state: state, action: action)
  }
  
  private func reducer(state: AppState, action: Action) -> AppState {
    var state = state
    
    switch action {
    case .addNote(let note):
      if !note.body.isEmpty {
        state.notes.append(note)
      }
    case .startUpdatingNote(let note):
      state.editingNote = note
    case .endUpdatingNote(let note):
      if let note = note {
        state.notes.removeAll(where: { $0.id == note.id })
        if !note.body.isEmpty {
          state.notes.append(note)
        }
      }
      state.editingNote = nil
    case .removeNote(let index):
      state.notes.remove(atOffsets: index)
    }
    
    return state
  }
}
