import Foundation

public enum RequestType {
    case requestPlain
    case requestParameters(parameters : [String:Any],parameterEncoding: ParameterEncodings)
}
