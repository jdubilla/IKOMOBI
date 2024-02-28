//
//  BestSalesViewModel.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

class BestSalesViewModel: ObservableObject {
    
    @Published var images: [UIImage] = []
    
    private func replaceLastPathComponent(of url: String, with id: String) -> String? {
        guard var urlComponents = URLComponents(string: url) else {
            return nil
        }
        
        var pathComponents = urlComponents.path.components(separatedBy: "/")
        
        guard !pathComponents.isEmpty else {
            return nil
        }
        
        pathComponents[pathComponents.count - 1] = id
        urlComponents.path = pathComponents.joined(separator: "/")
        
        return urlComponents.url?.absoluteString
    }

    func fetchImages(products: [Product]) {
        var arrayImages: [UIImage] = Array(repeating: UIImage(), count: products.count)
        let dispatchGroup = DispatchGroup()

        for (index, product) in products.enumerated() {
            let originalUrl = product.image
            
            guard let replacedUrl = self.replaceLastPathComponent(of: originalUrl, with: String(product.id)) else {
                continue
            }
            
            let url = URL(string: replacedUrl)!
            
            dispatchGroup.enter()
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                defer {
                    dispatchGroup.leave()
                }
                
                guard let data = data, error == nil else {
                    print("Failed to load image from URL: \(url)")
                    return
                }
                
                guard let image = UIImage(data: data) else {
                    print("Failed to create image from data")
                    return
                }
                
                arrayImages[index] = image
            }.resume()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.images = arrayImages
        }
    }



}
