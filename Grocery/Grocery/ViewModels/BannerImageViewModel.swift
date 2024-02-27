//
//  BannerImageViewModel.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

class BannerImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    
    func fetchImages(stringImage: String) {
        
        guard let url = URL(string: stringImage) else {
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
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
    
}
