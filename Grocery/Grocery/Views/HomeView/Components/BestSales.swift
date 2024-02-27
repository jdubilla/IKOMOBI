//
//  BestSales.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

struct BestSales: View {
    
    let products: [Product]
    
    @StateObject var vm = BestSalesViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Meilleures ventes")
                .font(.title3)
                .fontWeight(.semibold)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                ForEach(vm.images.indices, id: \.self) { index in
                    BestSalesTile(product: self.products[index], image: vm.images[index])
                }
            })
        }
        .onAppear {
            vm.fetchImages(products: products)
        }
        .padding(.horizontal, 15)
        .padding(.top, 32)
    }
}
