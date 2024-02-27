//
//  BestSalesViewModel.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

class BestSalesViewModel: ObservableObject {
    
    @Published var images: [UIImage] = []
    
    func fetchImages(products: [Product]) {
                
        for product in products {
            
            guard let url = URL(string: product.image) else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data, error == nil else {
                        print("Failed to load image from URL: \(url)")
                        return
                    }
                    
                    guard let image = UIImage(data: data) else {
                        print("Failed to create image from data")
                        return
                    }
                    self.images.append(image)
                }
            }.resume()
        }
    }
}
