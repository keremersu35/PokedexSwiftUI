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
    @Published var pokemons: Pokemon?
    @Published var isLoading: Bool = true

    init(dataRepository: DataRepositoryProtocol) {
        self.dataRepository = dataRepository
    }

    func fetchPokemons() {
        isLoading = true
        dataRepository.fetchPokemonList(offset: 1)
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
                    self.pokemons = pokemons
                } else {
                    print("Data cannot fetched")
                }
            }
            .store(in: &cancellables)
    }
}
