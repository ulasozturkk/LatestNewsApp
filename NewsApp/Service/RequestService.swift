//
//  HomePageService.swift
//  NewsApp
//
//  Created by macbook pro on 9.12.2023.
//

import Foundation


class RequestService {
    
    static let shared = RequestService()
    private init(){}
    
   
    
    func getArticles(endpoint : Endpoint, completion: @escaping (Result<NewsResponse,Error>)->()){
        NetworkManager.shared.createRequest(endpoint, completion: completion)
    }
    
}
