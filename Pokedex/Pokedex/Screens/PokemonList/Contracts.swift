//
//  Contracts.swift
//  Pokedex
//
//  Created by Kerem Ersu on 9.12.2023.
//

import Foundation

protocol PokemonListViewModelProtocol: AnyObject {
    func fetchPokemons()
    var numberOfPokemons: Int { get }
    func getPokemon(_ index: Int) -> Result
}
