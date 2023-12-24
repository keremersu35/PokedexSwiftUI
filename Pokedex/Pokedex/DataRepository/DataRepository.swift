import Foundation
import Combine

protocol DataRepositoryProtocol {
    func fetchPokemonList(offset: Int) -> AnyPublisher<PokemonModel?, Error>
    func fetchPokemonDetail(id: Int) -> AnyPublisher<PokemonDetailModel?, Error>
}
