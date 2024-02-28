//
//  CategoryTile.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

struct CategoryTile: View {
    
    let image: UIImage
    let categorieName: String
    
    var body: some View {
        VStack(spacing: 12) {
            Button(action: {
            }, label: {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .padding(16)
                    .background(Color(UIColor(hex: "#F3F5F7")))
                    .clipShape(Circle())
            })
            Text(categorieName)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(Color(UIColor(hex: "#000000")))
        }
    }
}
