//
//  PokemonImage.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 20/05/25.
//

import SwiftUI
import Kingfisher

struct PokemonImage: View {
    
    var image: KFImage
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .background(Circle().foregroundColor(.white))
            .shadow(radius: 5)
    }
}

#Preview {
    PokemonImage(image: KFImage(URL(string: PokemonModel().MOCK_POKEMON.imageUrl)))
}
