//
//  PokemonView.swift
//  PokedexApp
//
//  Created by Ricardo Massaki on 19/05/25.
//

import SwiftUI
import Kingfisher

struct PokemonView: View {
    
    @ObservedObject var pokemonVM = PokemonModel()
    @State private var searchText = ""
    @StateObject var viewModel = PokemonModel()
    
    var filteredPokemon: [Pokemon] {
        if searchText == "" { return pokemonVM.pokemon }
        return pokemonVM.pokemon.filter {
            $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredPokemon) { poke in
                    NavigationLink(destination: PokemonDetailView(pokemon: poke)) {
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text(poke.name.capitalized)
                                        .font(.title)
                                    if poke.isFavorite {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                }
                                
                                HStack {
                                    Text(poke.type.capitalized)
                                        .italic()
                                    Circle()
                                        .foregroundColor(poke.typeColor)
                                        .frame(width: 10, height: 10)
                                }
                                Text(poke.description)
                                    .font(.caption)
                                    .lineLimit(2)
                            }
                            
                            Spacer()
                            
                            KFImage(URL(string: poke.imageUrl))
                                .interpolation(.none)
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(action: { addFavorite(pokemon: poke)}) {
                            Image(systemName: "star")
                        }
                        .tint(.yellow)
                    }
                }
            }
            .toolbar {
                ToolbarItem(id: "logout",
                            placement: ToolbarItemPlacement.navigationBarTrailing,
                            showsByDefault: true) {
                    Button("Logout") {
                        viewModel.logout()
                    }
//                    .font(FontMaker.makeFont(.poppinsBold, 18))
//                    .foregroundStyle(PokedexColors.blue)
                }
            }
            .navigationTitle("Pokemon")
            .searchable(text: $searchText)
        }
    }
    
    func addFavorite(pokemon: Pokemon) {
        if let index = pokemonVM.pokemon.firstIndex(where: { $0.id == pokemon.id }) {
            pokemonVM.pokemon[index].isFavorite.toggle()
        }
    }
}

#Preview {
    PokemonView()
}
