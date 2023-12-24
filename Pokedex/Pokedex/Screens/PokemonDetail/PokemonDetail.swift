//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Kerem Ersu on 10.12.2023.
//

import SwiftUI

enum DetailTab: Int {
    case about = 0
    case stats = 1
}

struct PokemonDetail: View {
    @State private var selectedTab: Int = DetailTab.about.rawValue
    @StateObject private var viewModel = PokemonDetailViewModel(id: 1, dataRepository: DataRepository())
    var body: some View {
        DetailAppBar(pokemonName: viewModel.pokemon?.name.capitalizeFirstLetter() ?? "")
            .background(.pokedexDarkBlue)
        VStack {
            AsyncImage(url: viewModel.getPokemonImageURL()) { image in
                image
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.clear
                }
                .frame(width: 275 , height: 275)
            VStack(spacing: .zero) {
                Tabs(tabs: [Constants.about.rawValue, Constants.stats.rawValue], geoWidth: UIScreen.main.bounds.width, selectedTab: $selectedTab)
                VStack(alignment: .leading, spacing: .small) {
                    if let pokemon = viewModel.pokemon {
                        switch selectedTab {
                        case DetailTab.about.rawValue:
                            PokemonStatText(title: Constants.id.rawValue, value: String(describing: pokemon.id))
                            PokemonStatText(title: Constants.name.rawValue, value: String(describing: pokemon.name.capitalizeFirstLetter()))
                            PokemonStatText(title: Constants.height.rawValue, value: String(describing: pokemon.height))
                            PokemonStatText(title: Constants.weight.rawValue, value: String(describing: pokemon.weight))
                            PokemonStatText(title: Constants.baseExperience.rawValue, value: String(describing: pokemon.baseExperience))
                        case DetailTab.stats.rawValue:
                            ForEach(pokemon.stats ?? [], id: \.stat?.name) { stat in
                                ProgressView(stat.stat?.name?.capitalizeFirstLetter() ?? "", value: Float(stat.baseStat), total: 100)
                                    .tint(.pokedexBlue)
                            }
                        default:
                            Text("")
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.small)
                .background(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .onAppear {
            viewModel.fetchPokemonDetail()
        }
    }
}

#Preview {
    PokemonDetail()
}
