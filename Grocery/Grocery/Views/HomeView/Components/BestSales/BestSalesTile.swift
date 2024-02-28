//
//  BestSalesTile.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

struct BestSalesTile: View {
    
    let product: Product
    let image: UIImage
    @Binding var itemsCart: [Int64]
    
    @StateObject var vm = BestSalesTileViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                BestSalesTileImage(image: image)
                BestSalesTileProductInfos(product: product)
                BestSalesTileButtons(vm: vm, itemsCart: $itemsCart, product: product)
            }
        }
        .frame(width: 163, height: 214)
        .background(Color(UIColor(hex: "#F2F3F5")))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .onAppear {
            vm.onAppearUpdateQuantityItems(itemsCart: itemsCart, product: product)
        }
    }
    
}
