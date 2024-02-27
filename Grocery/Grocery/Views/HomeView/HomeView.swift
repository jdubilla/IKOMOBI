//
//  ContentView.swift
//  Grocery
//
//  Created by Jean-baptiste DUBILLARD on 27/02/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        
        HeaderHomeView()
        ScrollView {
            VStack {
                if let data = vm.data {
                    BannerImage(stringImage: data.banner.image)
                    Categories(categories: data.categories)
                    BestSales(products: data.products)
                } else {
                    Text("Loading...")
                }
            }
            .onAppear {
                vm.fetchData()
            }
        }
        Spacer()
        
    }
}

#Preview {
    HomeView()
}
