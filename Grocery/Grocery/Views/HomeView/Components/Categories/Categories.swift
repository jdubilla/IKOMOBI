//
//  Categories.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

struct Categories: View {
    
    let categories: [Category]
    
    @StateObject var vm = CategoriesViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Catégories")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.leading, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                    
                HStack {
                    ForEach(vm.images.indices, id: \.self) { index in
                        if index < categories.count {
                            CategoryTile(image: vm.images[index], categorieName: categories[index].name)
                        }
                    }
                }
                .padding(.leading, 13)
            }
        }
        .onAppear {
            vm.fetchImages(categories: categories)
        }
    }
}
