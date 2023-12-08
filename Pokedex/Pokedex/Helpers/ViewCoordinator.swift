//
//  ViewCoordinator.swift
//  Pokedex
//
//  Created by Kerem Ersu on 8.12.2023.
//

import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            PokemonList()
        }else {
            SplashScreen(isActive: $isActive)
        }
    }
}
