//
//  SignInViewModel.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 15/05/25.
//

import Foundation
import FirebaseAuth

class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var formInvalid = false
    var alertText = "Ocorreu um erro! Verifique o email ou a senha, e tente novamente."
    
    @Published var isLoading = false
    
    func signIn() {
        print("email: \(email), senha: \(password)")
        
        isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password) {
            result, err in
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                print(err)
                self.isLoading = false
                return
            }
            self.isLoading = false
            print("Usuário logado \(user.uid)")
        }
    }
}
