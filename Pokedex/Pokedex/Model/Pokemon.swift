//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kerem Ersu on 9.12.2023.
//

import Foundation

struct Pokemon: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Result]
}

struct Result: Codable {
    let name: String
    let url: String

    func getPokemonId() -> Int {
        return Int(url.split(separator: "/").dropLast().last ?? "") ?? 0
    }

    func getImageUrl() -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(getPokemonId()).png"
    }
}
