//
//  SignInView.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 15/05/25.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("pokedexLogo")
                    .frame(width: 250, height: 250)
                    .padding(.top, -120)
                
                Image("image_five")
                    .resizable()
                    .frame(width: 210, height: 210)
                    .padding(.vertical, -100)
                    .padding(.bottom, 90)
                    .padding()
                
                TextField("Entre com seu email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(RoundedRectangle(cornerRadius: 24.0)
                        .strokeBorder(Color(UIColor.separator),
                                      style: StrokeStyle(lineWidth: 1.0))
                    )
                    .padding(.bottom, 8)
                
                SecureField("Entre com sua senha", text: $viewModel.password)
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24.0)
                    .overlay(RoundedRectangle(cornerRadius: 24.0)
                        .strokeBorder(Color(UIColor.separator),
                                      style: StrokeStyle(lineWidth: 1.0))
                    )
                    .padding(.bottom, 30)
                
                Button {
                    viewModel.signIn()
                } label: {
                    Text("Entrar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("AzulEscuro"))
                        .foregroundColor(Color.white)
                        .cornerRadius(24.0)
                    
                }
                
                Divider()
                    .padding()
                
                Button {
                    print("Clicado")
                } label: {
                    Text("Não tem uma conta? Clique aqui")
                        .foregroundColor(Color.black)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .background(Color.init(red: 240 / 255, green: 231 / 255, blue: 210 / 255))
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    SignInView()
}
