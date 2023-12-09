//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Kerem Ersu on 8.12.2023.
//

import SwiftUI
import SwiftData

@main
struct PokedexApp: App {

    var body: some Scene {
        @State var isActive = false
        WindowGroup {
            ViewCoordinator()
        }
    }
}
