//
//  CategoriesViewModel.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

class CategoriesViewModel: ObservableObject {
    
    @Published var images: [UIImage] = []
    
    func fetchImages(categories: [Category]) {
        
        var arrayImages: [UIImage] = Array(repeating: UIImage(), count: categories.count)
        let dispatchGroup = DispatchGroup()
        
        for (index, category) in categories.enumerated() {
            
            guard let url = URL(string: category.image) else {
                return
            }
            
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
