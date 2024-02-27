//
//  BannerImage.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

struct BannerImage: View {
    
    let stringImage: String
    
    @StateObject var vm = BannerImageViewModel()
    
    var body: some View {
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 32)
            } else {
                Text("Loading...")
            }

        }.onAppear {
            vm.fetchImages(stringImage: stringImage)
        }
    }
}
