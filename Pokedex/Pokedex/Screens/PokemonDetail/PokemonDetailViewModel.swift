//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Kerem Ersu on 10.12.2023.
//

import Foundation
import Combine

final class PokemonDetailViewModel: ObservableObject {
    private let dataRepository: DataRepositoryProtocol
    private var cancellables: Set<AnyCancellable> = []
    @Published var pokemon: PokemonDetailModel?
    @Published var isLoading: Bool = true
    let id: Int

    init(id: Int, dataRepository: DataRepositoryProtocol) {
        self.dataRepository = dataRepository
        self.id = id
    }

    func fetchPokemonDetail() {
        isLoading = true
        dataRepository.fetchPokemonDetail(id: id)
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
            } receiveValue: { [weak self] pokemon in
                guard let self else { return}
                if let pokemon = pokemon {
                    self.pokemon = pokemon
                } else {
                    print("Data cannot fetched")
                }
            }
            .store(in: &cancellables)
    }
    
    func getPokemonImageURL() -> URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")!
    }
}
