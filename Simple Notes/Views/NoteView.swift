//
//  NoteView.swift
//  Simple Notes
//
//  Created by Bohdan on 10/4/20.
//

import SwiftUI

struct NoteView: View {
  
  @EnvironmentObject private var store: Store
  
  @State private var inputText: String = ""
  @Binding var isEditingModeActive: Bool
  
  var body: some View {
    NavigationView {
      TextEditor(text: $inputText)
        .padding()
      .navigationTitle("New note")
        .navigationBarItems(
          trailing:
            Button("Done", action: {
              saveNote()
            })
            .foregroundColor(.green)
        )
    }
    .onAppear {
      inputText = store.state.editingNote?.body ?? ""
    }
    .onDisappear {
      store.dispatch(action: .endUpdatingNote(nil))
      isEditingModeActive = false
    }
  }
  
  private func saveNote() {
    if var newNote = store.state.editingNote {
      newNote.update(with: inputText, at: Date())
      store.dispatch(action: .endUpdatingNote(newNote))
    } else {
      let newNote = Note(createdAt: Date(), with: inputText)
      store.dispatch(action: .addNote(newNote))
    }
    isEditingModeActive = false
  }
}

struct NoteView_Previews: PreviewProvider {
  
    static var previews: some View {
      NoteView(isEditingModeActive: .constant(true))
    }
}
