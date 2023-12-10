//
//  PokemonList.swift
//  Pokedex
//
//  Created by Kerem Ersu on 8.12.2023.
//

import SwiftUI

struct PokemonList: View {
    @StateObject private var viewModel = PokemonListViewModel(dataRepository: DataRepository())
    @State var searchText: String = ""

    var body: some View {
        VStack {
            TextField("Placeholder", text: $searchText)
                .padding(10)
                .background(Color.black.opacity(0.1))
                .cornerRadius(12)
                .padding(.small)
                .background(.pokedexBlue)
            if !viewModel.isLoading {
                ScrollView {
                    LazyVStack(content: {
                        ForEach(viewModel.pokemons ?? [], id: \.name) { pokemon in
                            PokemonCard(id: pokemon.getPokemonId(), name: pokemon.name, imageUrl: pokemon.getImageUrl())
                                .onAppear {
                                    if viewModel.isLastItem(pokemon: pokemon) {
                                        viewModel.loadMore()
                                    }
                                }
                        }
                    })
                    .padding(.horizontal, .small)
                }
                .refreshable {
                    viewModel.fetchPokemons()
                }
            } else {
                VStack {
                    LottieView(lottieFile: Constants.loading.rawValue)
                        .frame(width: .large, height: .large)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear {
            viewModel.fetchPokemons()
        }
    }
}

#Preview {
    PokemonList()
}
