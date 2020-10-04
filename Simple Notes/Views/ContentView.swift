//
//  ContentView.swift
//  Simple Notes
//
//  Created by Bohdan on 10/3/20.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var store: Store
  @State private var isEditingModeActive: Bool = false
  
  var body: some View {
    NavigationView {
      NotesListView(isEditingModeActive: $isEditingModeActive).environmentObject(self.store)
        .navigationBarTitle("Notes")
        .navigationBarItems(
          trailing:
            Button("Add", action: {
              isEditingModeActive = true
            })
        )
    }
    .sheet(isPresented: $isEditingModeActive) {
      NoteView(isEditingModeActive: $isEditingModeActive).environmentObject(self.store)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  
  static var previews: some View {
    ContentView().environmentObject(Store())
  }
}
