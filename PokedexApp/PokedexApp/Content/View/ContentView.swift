//
//  ContentView.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 20/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @State private var showLaunchScreen = true
    
    var body: some View {
        ZStack {
            if showLaunchScreen {
                LaunchScreenView()
            } else {
                if viewModel.isLogged {
                    PokemonView()
                } else {
                    SignInView()
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
            // Duração da splash (simulada)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showLaunchScreen = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
