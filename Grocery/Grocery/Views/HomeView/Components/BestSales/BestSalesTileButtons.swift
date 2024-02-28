//
//  BestSalesTileButtons.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 28/02/2024.
//

import SwiftUI

struct BestSalesTileButtons: View {
    
    @StateObject var vm: BestSalesTileViewModel
    @Binding var itemsCart: [Int64]
    let product: Product
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                VStack {
                    if vm.quantityItems > 0 {
                        Button(action: {
                            vm.removeProductFromCart(itemsCart: $itemsCart, product: product)
                        }, label: {
                            Image(systemName: "minus")
                        })
                        .frame(width: 36, height: 36)
                        .background(Color(UIColor(hex: "#E5E6E8")))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                        
                        Text(String(vm.quantityItems))
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    Button(action: {
                        vm.addProtuctToCart(itemsCart: $itemsCart, product: product)
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .frame(width: 36, height: 36)
                    .background(Color(UIColor(hex: "#23AA49")))
                    .clipShape(Circle())
                    .foregroundColor(.white)
                }
                .padding(.trailing, 12)
                .padding(.bottom, 12)
                
            }
        }
    }
}
