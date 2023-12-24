import Foundation


public enum Endpoints {
    case pokemonList(offset: Int)
    case pokemonDetail(id: Int)
}

extension Endpoints : BaseEndpoint {
    
    public var baseURL: URL {
        return URL(string: APIConstants.baseURL.rawValue)!
    }
    
    public var headers: [String : String]? {
        nil
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .pokemonList(offset: let offset):
            return [APIConstants.offset.rawValue: offset]
        case .pokemonDetail(id: let id):
            return nil
        }
    }
    
    public var scheme: RequestScheme{
        return .https
    }
    
    public var path: String {
        switch self {
        case .pokemonList:
            return APIConstants.pokemonListPath.rawValue
        case .pokemonDetail(id: let id):
            return "\(APIConstants.pokemonDetailPath.rawValue)\(id)"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .pokemonList:
            return .get
        case .pokemonDetail:
            return .get
        }
    }
    
    public var requestType: RequestType {
        switch self {
        case .pokemonList:
            return .requestPlain
        case .pokemonDetail:
            return .requestPlain
        }
    }
    
    public var showOverlay: Bool{
        return true
    }
}
