//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Kerem Ersu on 9.12.2023.
//

import Foundation
import Combine

final class PokemonListViewModel: ObservableObject {
    private let dataRepository: DataRepositoryProtocol
    private var cancellables: Set<AnyCancellable> = []
    @Published var pokemons: [Result]?
    @Published var isLoading: Bool = true
    @Published var currentPage: Int = 0

    init(dataRepository: DataRepositoryProtocol) {
        self.dataRepository = dataRepository
    }

    func fetchPokemons() {
        isLoading = true
        dataRepository.fetchPokemonList(offset: 0)
            .sink {  [weak self] completion in
                guard let self else { return}
                switch completion {
                case .finished:
                    self.isLoading = false
                    print("Request completed successfully.")
                case .failure(let error):
                    self.isLoading = false
                    print("Request failed with error: \(error)")
                }
            } receiveValue: { [weak self] pokemons in
                guard let self else { return}
                if let pokemons = pokemons {
                    self.pokemons = pokemons.results
                } else {
                    print("Data cannot fetched")
                }
            }
            .store(in: &cancellables)
    }
    
    func isLastItem(pokemon: Result) -> Bool {
        pokemon.getPokemonId() == pokemons?.last?.getPokemonId()
    }
    
    func loadMore() {
        
        currentPage += 1
        dataRepository.fetchPokemonList(offset: currentPage * 20)
            .sink {  [weak self] completion in
                guard let self else { return}
                switch completion {
                case .finished:
                    self.isLoading = false
                    print("Request completed successfully.")
                case .failure(let error):
                    self.isLoading = false
                    print("Request failed with error: \(error)")
                }
            } receiveValue: { [weak self] pokemons in
                guard let self else { return}
                if let pokemons = pokemons {
                    self.pokemons? += pokemons.results
                } else {
                    print("Data cannot fetched")
                }
            }
            .store(in: &cancellables)
    }
    
}
