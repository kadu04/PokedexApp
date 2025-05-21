//
//  SignInViewModel.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 15/05/25.
//

import Foundation
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var formInvalid = false
    var alertText = "Ocorreu um erro! Verifique o email ou a senha, e tente novamente."
    
    @Published var isLoading = false
    
    func signUp() {
        isLoading = true
        print("nome: \(name), email: \(email), senha: \(password)")
        
        Auth.auth().createUser(withEmail: email, password: password) {
            result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                print(err)
                self.isLoading = false
                return
            }
            self.isLoading = false
            print("Usuário criado \(user.uid)")
        }
    }
}
