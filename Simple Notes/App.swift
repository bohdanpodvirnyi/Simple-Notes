//
//  App.swift
//  Simple Notes
//
//  Created by Bohdan on 10/3/20.
//

import SwiftUI

@main
struct Simple_NotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Store())
        }
    }
}
