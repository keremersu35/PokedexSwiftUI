//
//  PokemonList.swift
//  Pokedex
//
//  Created by Kerem Ersu on 8.12.2023.
//

import SwiftUI

struct PokemonList: View {
    @State var searchText: String = ""

    var body: some View {
        VStack {
            TextField("Placeholder", text: $searchText)
                .padding(10)
                .background(Color.black.opacity(0.1))
                .cornerRadius(12)
                .padding(.small)
        }
        .background(.pokedexBlue)
        ScrollView {
            LazyVStack(content: {
                ForEach(1...30, id: \.self) { count in
                    PokemonCard(id: 341, name: "Poseidon", imageUrl: "")
                }
            })
            .padding(.horizontal, .small)
        }
    }
}

#Preview {
    PokemonList()
}
