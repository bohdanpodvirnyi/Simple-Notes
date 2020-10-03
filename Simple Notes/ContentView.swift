//
//  ContentView.swift
//  Simple Notes
//
//  Created by Bohdan on 10/3/20.
//

import SwiftUI

struct ContentView: View {
  
  @State var notes: [Note] = []
  @State private var noteBody: String = ""
  
  var addNoteView: some View {
    NavigationView {
        TextEditor(text: $noteBody)
        .navigationBarTitle(Text("New note"), displayMode: .inline)
          .onDisappear {
            guard !noteBody.isEmpty else { return }
            let note = Note(createdAt: Date(), with: noteBody)
            notes.append(note)
            noteBody = ""
          }
    }
  }
  
    var body: some View {
      NavigationView {
        List(notes, id: \.createdAt) { note in
          Text(note.body)
        }
        .navigationBarTitle("Notes")
        .navigationBarItems(
          trailing:
            NavigationLink("Add", destination: addNoteView)
        )
      }
    }
}

struct Note {
  let createdAt: Date
  var updatedAt: Date
  var body: String = ""
  
  init(createdAt date: Date, with body: String) {
    self.createdAt = date
    self.updatedAt = date
    self.body = body
  }
  
  mutating func update(with text: String, at date: Date) {
    body = text
    updatedAt = date
  }
}

struct ContentView_Previews: PreviewProvider {
  
    static var previews: some View {
      ContentView()
    }
}
