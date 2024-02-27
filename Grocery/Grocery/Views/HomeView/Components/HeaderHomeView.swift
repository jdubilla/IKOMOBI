//
//  HeaderHomeView.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

struct HeaderHomeView: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("user")
                .resizable()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("Bonjour")
                    .font(.caption)
                    .foregroundColor(Color(UIColor(hex: "#5B6A6A")))
                Text("Jean Pascal")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            .padding(.leading, 16)
            Spacer()
            Button(action: {
                
            }, label: {
                Image("shoppingCart")
                    .padding(11)
                    .background(Color(UIColor(hex: "#F1F1F5")))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
        }
        .padding(EdgeInsets(top: 14, leading: 13, bottom: 0, trailing: 28))
    }
}

#Preview {
    HeaderHomeView()
}
