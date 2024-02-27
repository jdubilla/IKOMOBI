//
//  HomeViewModel.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var data: GroceryData? = nil
    @Published var showAlert = false
    @Published var messageError = ""
    
    private let apiService = APIService()
    
    func fetchData() {
        apiService.fetchDataGrocery { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let responseData):
                    print(responseData)
                    self.data = responseData
                case .failure(let error):
                    print("ERROR")
                    self.messageError = error.localizedDescription
                    self.showAlert = true
                }
            }
        }
    }
}
