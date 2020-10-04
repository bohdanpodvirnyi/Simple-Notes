//
//  NotesListView.swift
//  Simple Notes
//
//  Created by Bohdan on 10/4/20.
//

import SwiftUI

struct NotesListView: View {
  
  @EnvironmentObject var store: Store
  
  @Binding var isEditingModeActive: Bool
  
  var body: some View {
    List {
      ForEach(store.state.notes.sorted(by: { $0.updatedAt > $1.updatedAt })) { note in
        Text(note.body)
          .onTapGesture(count: 1, perform: {
            self.store.dispatch(action: Action.startUpdatingNote(note))
            self.isEditingModeActive = true
          })
      }
      .onDelete {
        self.store.dispatch(action: .removeNote($0))
      }
    }
  }
  
}
