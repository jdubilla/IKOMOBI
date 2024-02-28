//
//  BestSales.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

struct BestSales: View {
    
    let products: [Product]
    @Binding var itemsCart: [Int64]
    
    @StateObject var vm = BestSalesViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Meilleures ventes")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 16)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16, content: {
                ForEach(vm.images.indices, id: \.self) { index in
                    BestSalesTile(product: self.products[index], image: vm.images[index], itemsCart: $itemsCart)
                }
            })
        }
        .onAppear {
            vm.fetchImages(products: products)
        }
        .padding(.horizontal, 16)
        .padding(.top, 32)
    }
}
