//
//  ContentViewModel.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 20/05/25.
//

import Foundation
import FirebaseAuth

class ContentViewModel: ObservableObject {
    
    @Published var isLogged = Auth.auth().currentUser != nil
    
    func onAppear() {
        Auth.auth().addStateDidChangeListener { Auth, user in
            self.isLogged = user != nil
        }
    }
}
