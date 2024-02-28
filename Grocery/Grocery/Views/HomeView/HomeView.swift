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
        VStack(spacing: 0) {
            HeaderHomeView(itemsCart: $vm.itemsCart)
            ScrollView {
                VStack(spacing: 0) {
                    if let data = vm.data {
                        BannerImage(stringImage: data.banner.image)
                        Categories(categories: data.categories)
                        BestSales(products: data.products, itemsCart: $vm.itemsCart)
                    } else {
                        Text("Loading...")
                    }
                }
                .onAppear {
                    vm.fetchData()
                    vm.loadItemsCart()
                }
            }
        }
        .alert(isPresented: $vm.showAlert) {
            Alert(title: Text("Error"), message: Text(vm.messageError), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    HomeView()
}
