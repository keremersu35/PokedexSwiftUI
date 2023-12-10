//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kerem Ersu on 9.12.2023.
//

import Foundation

struct Pokemon: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Result]
}

struct Result: Decodable, Equatable {
    let name: String
    let url: String

    func getPokemonId() -> Int {
        return Int(url.split(separator: "/").last ?? "") ?? 0
    }

    func getImageUrl() -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(getPokemonId()).png"
    }
}
