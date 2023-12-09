import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    
    func createRequest<T:Codable>(_ endpoint: Endpoint, completion : @escaping (Result<T,Error>) -> ()) {
        
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            

            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode <= 299 else {
                completion(.failure(NSError(domain: "invalid response", code: 0)))
                return
            }
            guard let Jsondata = data else {
                completion(.failure(NSError(domain: "invalid response data", code: 0)))
                return
            }
            // data geldi
            //print(String(data: Jsondata, encoding: .utf8) ?? "Invalid JSON")
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: Jsondata)
                completion(.success(decodedData))
            } catch {
                print("Decode Hatası: \(error)")
                completion(.failure(error))
            }

        }
        task.resume()
    }
}
