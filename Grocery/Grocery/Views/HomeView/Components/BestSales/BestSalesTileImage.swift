//
//  BestSalesTileImage.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 28/02/2024.
//

import SwiftUI

struct BestSalesTileImage: View {
    
    let image: UIImage
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 75, height: 98)
            Spacer()
        }
        .padding(.top, 20)
    }
}
