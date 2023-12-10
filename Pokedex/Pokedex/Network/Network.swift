import Foundation
import Combine

protocol APIClientProtocol {
    associatedtype M
    func request<T: Decodable>(_ endpoint: M) -> AnyPublisher<T?, Error>
}

open class APIClient<M: BaseEndpoint>: APIClientProtocol {
    
    func request<T: Decodable>(_ endpoint: M) -> AnyPublisher<T?, Error> {
        if endpoint.showOverlay {
            
        }
        var urlComponents = URLComponents(string: endpoint.baseURL.absoluteString + endpoint.path)
        urlComponents?.scheme = endpoint.scheme.rawValue
        urlComponents?.queryItems = endpoint.parameters?.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
        
        guard let url = urlComponents?.url else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }

        switch endpoint.requestType {
        case .requestParameters(parameters: let parameters, parameterEncoding: let encoding):
            switch encoding {
            case .queryString:
                break
            case .httpBody:
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
        case .requestPlain:
            break
        }

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                print(httpResponse.statusCode)
                return data
            }
            .decode(type: T?.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
