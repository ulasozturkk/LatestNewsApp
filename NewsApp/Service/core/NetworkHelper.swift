
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
    case getEverything(q: String?, from: String?, to: String? )
    case topHeadlines(q: String?,country: String? ,from:String?,to: String?,category: String?)
}

extension Endpoint : EndpointProtocol {
    
    
    var baseURL: String {
        let base = "https://newsapi.org"
        return base
    }
    
    var path: String {
        switch self {
        case .getEverything:
            return "/v2/everything"
        case .topHeadlines:
            return "/v2/top-headlines"
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
            print("geteverything seçildi")
            if let q = q {
                queryItems.append(URLQueryItem(name: "q", value: q))
            }
            
            if let from = from {
                queryItems.append(URLQueryItem(name: "from", value: from))
            }
            if let to = to {
                queryItems.append(URLQueryItem(name: "to", value: to))
            }
        case .topHeadlines(let q,let country,let from,let to,let category):
            print("topheadlines seçildi")
            if let q = q {
                queryItems.append(URLQueryItem(name: "q", value: q))
            }
            if let country = country {
                queryItems.append(URLQueryItem(name: "country", value: country))
            }
            if let category = category {
                queryItems.append(URLQueryItem(name: "category", value: category))
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
        print(baseURL)
        print(components.queryItems)
        guard let url = components.url else{
            fatalError("url atanmadı")
        }
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }

    
}
