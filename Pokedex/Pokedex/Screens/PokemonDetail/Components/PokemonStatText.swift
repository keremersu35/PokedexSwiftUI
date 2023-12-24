//
//  PokemonStatText.swift
//  Pokedex
//
//  Created by Kerem Ersu on 21.12.2023.
//

import SwiftUI

struct PokemonStatText: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: .medium, weight: .bold))
                .foregroundStyle(.pokedexDarkBlue)
                .multilineTextAlignment(.leading)
            Spacer()
            Text(value)
                .font(.system(size: .medium, weight: .regular))
                .foregroundStyle(.pokedexBlue)
                .multilineTextAlignment(.leading)
        }
    }
}
