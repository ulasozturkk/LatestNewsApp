//
//  NetworkManager.swift
//  NewsApp
//
//  Created by macbook pro on 8.12.2023.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    func createRequest<T:Decodable>(_ endpoint: Endpoint, completion : @escaping (Result<T,Error>) -> ()) {
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            

            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode <= 299 else {
                completion(.failure(NSError(domain: "invalid response", code: 0)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "invalid response data", code: 0)))
                return
            }
            
            do {
                print("burası neresi amk")

                let decodedData = try JSONDecoder().decode(T.self,from: data)
                                print(decodedData)
                completion(.success(decodedData))
            }catch {}
        }
        task.resume()
    }
}
