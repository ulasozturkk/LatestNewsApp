//
//  HomePageService.swift
//  NewsApp
//
//  Created by macbook pro on 9.12.2023.
//

import Foundation


class HomePageService {
    
    static let shared = HomePageService()
    private init(){}
    
    func setEveryEndpoint(query:String? = nil , from:String? = nil, to:String? = nil) -> Endpoint{
        return Endpoint.getEverything(q: query, from: from, to: to)
    }
    func setTopEndpoint(query:String? = nil,country: String? = nil,to:String? = nil,from:String?=nil) ->Endpoint{
        return Endpoint.topHeadlines(q: query, country: country, from: from, to: to)
    }
    
    func getEveryArticles(endpoint : Endpoint, completion: @escaping (Result<[Article],Error>)->()){
        print(endpoint)
        NetworkManager.shared.createRequest(endpoint, completion: completion)
    }
    
    func getTopHeadlineArticles(query: String? = nil,country: String? = nil,from: String? = nil,to: String? = nil,
                                endpoint: Endpoint,completion: @escaping (Result<[Article],Error>)->()) {
        
        NetworkManager.shared.createRequest(endpoint, completion: completion)
    }
    
}
