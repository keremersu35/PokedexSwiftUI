import Foundation
import Combine

protocol DataRepositoryProtocol {
    func fetchPokemonList(offset: Int) -> AnyPublisher<Pokemon?, Error>
    //func fetchPokemonDetail(id: Int) -> AnyPublisher<PostGet?, Error>
}
