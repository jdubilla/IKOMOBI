//
//  HomeViewModel.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import Foundation
import CoreData

class HomeViewModel: ObservableObject {
    
    @Published var data: GroceryData? = nil
    @Published var itemsCart: [Int64] = []
    @Published var showAlert = false
    @Published var messageError = ""
    
    private let apiService = APIService()
    
    func fetchData() {
        apiService.fetchDataGrocery { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let responseData):
                    self.data = responseData
                case .failure(let error):
                    self.messageError = error.localizedDescription
                    self.showAlert = true
                }
            }
        }
    }
    
    func loadItemsCart() {
        let request: NSFetchRequest<ProductCart> = ProductCart.fetchRequest()
        
        guard let products = try? CoreDataStack.sharedInstance.viewContext.fetch(request) else {
            return
        }
        
        var arrayIdsProducts: [Int64] = []
        for product in products {
            arrayIdsProducts.append(product.id)
        }
        
        self.itemsCart = arrayIdsProducts
    }
}
