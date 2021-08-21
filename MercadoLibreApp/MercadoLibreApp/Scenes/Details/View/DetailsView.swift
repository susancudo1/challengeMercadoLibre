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
    @Environment(\.presentationMode) var presentationMode

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
                        Text("\(product.condition.capitalizingFirstLetter())" +
                                " - \(product.seller.sellerReputation.transactions.completed) " +
                                "\("text_sold_detaails_view".localized)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .onAppear {
                                self.isNavigationBarHidden = true
                            }

                        Text("\(product.title)")
                            .font(.largeTitle)

                        Text(String(repeating: "★",
                                    count: Int(5 * product.seller.sellerReputation.transactions.ratings.positive)))
                            .font(.body)
                            .foregroundColor(Color(UIColor.systemYellow))

                        Text("$\(Int(product.price)) \(product.currencyId)")
                            .font(.largeTitle)
                    }
                    Spacer()
                }.padding()
                Spacer()
            }.padding(.top)
        }
        .overlay(
            HStack {
                VStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .font(.largeTitle)
                            .foregroundColor(Color(UIColor.systemGray))
                    })
                    .padding(.leading)
                    .padding(.top, 20)
                    Spacer()
                }
                Spacer()
            }
        )
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(product: Product(ident: UUID().uuidString,
                                     title: "Producto",
                                     price: 12000.0,
                                     thumbnail: "http://mla-s2-p.mlstatic.com/795558-MLA31003306206_062019-I.jpg",
                                     imageData: nil,
                                     condition: "Nuevo",
                                     seller: Seller(sellerReputation:
                                                        SellerReputation(transactions:
                                                                            Transactions(ratings:
                                                                                            Ratings(positive: 0.2),
                                                                                         completed: 10))),
                                     currencyId: "COP"),
                    isNavigationBarHidden: .constant(true))
    }
}
