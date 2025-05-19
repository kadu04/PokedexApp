//
//  LaunchScreenView.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 19/05/25.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color(red: 0 / 250, green: 0 / 255, blue: 40 / 255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image("Pokeball")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Spacer()
                ProgressView()
                Spacer().frame(height: 50)
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
