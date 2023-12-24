//
//  DetailAppBar.swift
//  Pokedex
//
//  Created by Kerem Ersu on 10.12.2023.
//

import SwiftUI

struct DetailAppBar: View {
    var pokemonName: String
    
    var body: some View {
        HStack() {
            Image(systemName: Constants.chevronLeft.rawValue)
                .resizable()
                .frame(width: 12, height: .medium)
                .foregroundColor(.white)
            Spacer()
            Text(pokemonName)
                .font(.system(size: .medium, weight: .semibold))
                .foregroundColor(.white)
            Spacer()
            Image(systemName: Constants.star.rawValue)
                .resizable()
                .frame(width: .medium, height: .medium)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
