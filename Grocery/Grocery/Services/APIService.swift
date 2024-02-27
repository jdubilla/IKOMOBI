//
//  APIService.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import Foundation

class APIService {
    
    func fetchDataGrocery(completion: @escaping (Result<GroceryData, Error>) -> Void) {
        
        guard let url = URL(string: "https://agf.ikomobi.fr/ios-hiring-test/home.json") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "No HTTP Response", code: 0, userInfo: nil)))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(NSError(domain: "Invalid HTTP Response: \(httpResponse.statusCode)", code: httpResponse.statusCode, userInfo: nil)))
                return
            }
            
            guard let responseData = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let groceryData = try decoder.decode(GroceryData.self, from: responseData)
                completion(.success(groceryData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
