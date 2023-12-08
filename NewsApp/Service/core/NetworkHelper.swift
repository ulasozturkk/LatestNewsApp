
import Foundation
import Alamofire

protocol EndpointProtocol {
    var baseURL : String {get}
    var path: String {get}
    var method : HTTPMethod {get}
    var headers: [String:String]? {get}
    
    func request() -> URLRequest
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Endpoint {
    static let apiKey = "52b3912244434becb613cd6869c465fc"
    case getEverything(q: String?, from: String?, to: String?)
    case topHeadlines(q: String?,country: String? ,from:String?,to: String?)
}

extension Endpoint : EndpointProtocol {
    var baseURL: String {
        let base = "https://newsapi.org/v2/"
        return base
    }
    
    var path: String {
        switch self {
        case .getEverything:
            return "/everything"
        case .topHeadlines:
            return "/top-headlines"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getEverything:
            return .get
        case .topHeadlines:
            return .get
        }
    }
    var headers: [String: String]? {
        return ["Authorization": Endpoint.apiKey]
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL) else {
            fatalError("url error")
        }
        
        var queryItems = [URLQueryItem]()
        
        switch self{
        case .getEverything(let q,let from,let to):
            if let q = q {
                queryItems.append(URLQueryItem(name: "q", value: q))
            }
            if let from = from {
                queryItems.append(URLQueryItem(name: "from", value: from))
            }
            if let to = to {
                queryItems.append(URLQueryItem(name: "to", value: to))
            }
        case .topHeadlines(let q,let country,let from,let to):
            if let q = q {
                queryItems.append(URLQueryItem(name: "q", value: q))
            }
            if let country = country {
                queryItems.append(URLQueryItem(name: "country", value: country))
            }
            if let from = from {
                queryItems.append(URLQueryItem(name: "from", value: from))
            }
            if let to = to {
                queryItems.append(URLQueryItem(name: "to", value: to))
            }
        }
        
        queryItems.append(URLQueryItem(name: "apiKey", value: Endpoint.apiKey))
        components.path = path
        components.queryItems = queryItems
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        return request
    }

    
}
