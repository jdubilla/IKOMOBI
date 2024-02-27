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
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 98)
                    Spacer()
                }
                .padding(.top, 20)
                
                VStack {
                    Spacer()
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(product.name)
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            Text("Le Kilo")
                                .foregroundColor(Color(UIColor(hex: "#FF324B")))
                                .font(.system(size: 12))
                            Text(String(product.price))
                                .foregroundColor(Color(UIColor(hex: "#FF324B")))
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                        }
                        .padding(.leading, 17)
                        .padding(.bottom, 15)
                        Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "minus")
                            })
                            .frame(width: 36, height: 36)
                            .background(Color(UIColor(hex: "#E5E6E8")))
                            .clipShape(Circle())
                            .foregroundColor(.white)
                            
                            Text("1")
                            
                            Button(action: {
                                
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
        .frame(width: 163, height: 214)
        .background(Color(UIColor(hex: "#F2F3F5")))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}
