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
    
    func createEndPoint(type: String,q:String? = nil,country:String? = nil,from:String? = nil,to:String?=nil) -> Endpoint{
        switch type{
        case "everything":
            return Endpoint.getEverything(q: q, from: from, to: to)
        case "top-headlines":
            return Endpoint.topHeadlines(q: q, country: country, from: from, to: to)
        default:
            fatalError("error")
        }
    }
    
    func getArticles(endpoint : Endpoint, completion: @escaping (Result<NewsResponse,Error>)->()){
        NetworkManager.shared.createRequest(endpoint, completion: completion)
    }
    
}
