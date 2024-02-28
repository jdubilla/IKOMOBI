//
//  BestSalesTileProductInfos.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 28/02/2024.
//

import SwiftUI

struct BestSalesTileProductInfos: View {
    
    let product: Product
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(product.name)
                        .foregroundColor(.black)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                    Text("Le Kilo")
                        .foregroundColor(Color(UIColor(hex: "#FF324B")))
                        .font(.system(size: 12))
                    Text("\(String(product.price))€")
                        .foregroundColor(Color(UIColor(hex: "#FF324B")))
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                }
                .padding(.leading, 17)
                .padding(.bottom, 15)
                Spacer()
            }
        }
    }
}
