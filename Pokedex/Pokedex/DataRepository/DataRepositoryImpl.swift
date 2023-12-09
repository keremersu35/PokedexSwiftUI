import Foundation
import Combine

final class DataRepository: APIClient<Endpoints>, DataRepositoryProtocol {

    public override init() {
        super.init()
    }
    
    func fetchPokemonList(offset: Int) -> AnyPublisher<Pokemon?, Error> {
        return self.request(.pokemonList(offset: offset))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
