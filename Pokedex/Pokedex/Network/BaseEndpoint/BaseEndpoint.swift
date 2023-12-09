import Foundation

public protocol BaseEndpoint {
    
    var scheme : RequestScheme {get}
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var requestType : RequestType { get }
    var showOverlay : Bool { get }
}
