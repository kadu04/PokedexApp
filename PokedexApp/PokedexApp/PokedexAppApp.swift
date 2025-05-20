//
//  PokedexAppApp.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 15/05/25.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct PokedexAppApp: App {
    
    init() {
        FirebaseApp.configure()
//        try! Auth.auth().signOut()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
