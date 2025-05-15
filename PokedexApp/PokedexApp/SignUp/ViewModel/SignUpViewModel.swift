//
//  SignInViewModel.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 15/05/25.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    func signUp() {
        print("nome: \(name), email: \(email), senha: \(password)")
    }
}
