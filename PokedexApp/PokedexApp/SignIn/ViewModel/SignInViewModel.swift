//
//  SignInViewModel.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 15/05/25.
//

import Foundation

class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() {
        print("email: \(email), senha: \(password)")
    }
}
