//
//  CellView.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 18/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import SwiftUI

struct CellView: View {

    var product: Product

    var body: some View {
        HStack {
            if product.imageData != nil {
                Image(uiImage: UIImage(data: product.imageData!)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            } else {
                Image(systemName: "xmark.octagon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }

            VStack(alignment: .leading) {
                Text("\(product.title)")
                    .font(.system(.body, design: .rounded))
                    .bold()

                Text("$\(Int(product.price))")
                .font(.system(.body, design: .rounded))
                    .padding(.top)
            }

        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(product: Product(id: "",
                                  title: "",
                                  price: 0.0,
                                  thumbnail: "",
                                  imageData: nil,
                                  condition: "",
                                  seller: Seller(
                                    seller_reputation: SellerReputation(
                                        transactions: Transactions(
                                            ratings: Ratings(positive: 0.0),
                                            completed: 0))),
                                  currency_id: ""))
    }
}

