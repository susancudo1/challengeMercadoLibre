//
//  DetailsView.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import SwiftUI

struct DetailsView: View {

    var product: Product
    @Binding var isNavigationBarHidden: Bool

    init(product: Product,
         isNavigationBarHidden: Binding<Bool>) {
        self.product = product
        self._isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if product.imageData != nil {
                    Image(uiImage: UIImage(data: (product.imageData)!)!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    .cornerRadius(30)
                } else {
                    Image(systemName: "xmark.octagon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    .cornerRadius(30)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(product.condition.capitalizingFirstLetter()) - \(product.seller.seller_reputation.transactions.completed) Vendidos")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .onAppear {
                                self.isNavigationBarHidden = true
                            }
                        
                        Text("\(product.title)")
                        .font(.largeTitle)
                        
                        Text(String(repeating: "★", count: Int(5 * product.seller.seller_reputation.transactions.ratings.positive)))
                            .font(.body)
                            .foregroundColor(Color(UIColor.systemYellow))
                        
                        Text("$\(Int(product.price)) \(product.currency_id)")
                            .font(.largeTitle)
                    }
                    Spacer()
                }.padding()
                Spacer()
            }
        }
        
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(product: Product(id: UUID().uuidString,
                                     title: "Producto",
                                     price: 12000.0,
                                     thumbnail: "http://mla-s2-p.mlstatic.com/795558-MLA31003306206_062019-I.jpg",
                                     imageData: nil,
                                     condition: "Nuevo",
                                     seller: Seller(seller_reputation: SellerReputation(transactions: Transactions(ratings: Ratings(positive: 0.2), completed: 10))),
                                     currency_id: "COP"),
                    isNavigationBarHidden: .constant(true))
    }
}

