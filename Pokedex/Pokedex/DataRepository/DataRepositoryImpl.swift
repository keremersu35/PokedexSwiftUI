import Foundation
import Combine

final class DataRepository: APIClient<Endpoints>, DataRepositoryProtocol {

    public override init() {
        super.init()
    }
    
    func fetchPokemonList(offset: Int) -> AnyPublisher<PokemonModel?, Error> {
        return self.request(.pokemonList(offset: offset))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchPokemonDetail(id: Int) -> AnyPublisher<PokemonDetailModel?, Error> {
        return self.request(.pokemonDetail(id: id))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
