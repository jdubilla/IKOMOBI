//
//  BestSalesTileViewModel.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI
import CoreData

class BestSalesTileViewModel: ObservableObject {
    
    @Published var quantityItems = 0
    
    func onAppearUpdateQuantityItems(itemsCart: [Int64], product: Product) {
        self.quantityItems = itemsCart.filter { $0 == product.id }.count
    }
    
    func addProtuctToCart(itemsCart: Binding<[Int64]>, product: Product) {
        let productCart = ProductCart(context: CoreDataStack.sharedInstance.viewContext)
        productCart.id = Int64(product.id)
        productCart.name = product.name
        productCart.price = product.price
        
        do {
            try CoreDataStack.sharedInstance.viewContext.save()
            itemsCart.wrappedValue.append(Int64(product.id))
            self.quantityItems += 1
            
        } catch {
            print("We were unabled to save \(product)")
        }
    }
    
    func removeProductFromCart(itemsCart: Binding<[Int64]>, product: Product) {

        let request: NSFetchRequest<ProductCart> = ProductCart.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", product.id)
        
        do {
            let productCarts = try CoreDataStack.sharedInstance.viewContext.fetch(request)
            
            if let productCart = productCarts.first {
                CoreDataStack.sharedInstance.viewContext.delete(productCart)
                try CoreDataStack.sharedInstance.viewContext.save()
            }
            
            if let index = itemsCart.wrappedValue.firstIndex(of: Int64(product.id)) {
                itemsCart.wrappedValue.remove(at: index)
                self.quantityItems -= 1
            }
            
        } catch {
            print("Error removing product from cart: \(error)")
        }
    }

}
