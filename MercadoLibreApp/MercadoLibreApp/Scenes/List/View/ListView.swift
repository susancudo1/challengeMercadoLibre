//
//  ListView.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import SwiftUI

struct ListView: View {

    @ObservedObject private var viewModel: SearchViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var isNavigationBarHidden: Bool

    var searchText: String
    private var presenter: ListPresenter

    init(searchText: String,
         isNavigationBarHidden: Binding<Bool>,
         viewModel: SearchViewModel) {

        self.presenter = ListPresenterFactory(viewModel: viewModel).createPresenter()
        self.viewModel = viewModel
        self.searchText = searchText
        self._isNavigationBarHidden = isNavigationBarHidden

    }

    var body: some View {

        VStack {
            ZStack {
            HStack {
                Button(action: {
                    self.viewModel.action = nil
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                }).padding(.all)
                Spacer()
            }
                Text(self.searchText)
            }
            ZStack {
                ScrollView {
                    VStack {
                    ForEach(self.viewModel.arrayPorducts, id: \.ident) { product in
                        NavigationLink(destination: DetailsView(product: product,
                                                                isNavigationBarHidden: self.$isNavigationBarHidden),
                                       tag: product.ident,
                                       selection: self.$viewModel.selectedProduct) {
                            EmptyView()
                        }
                        CellView(product: product)
                            .onTapGesture {
                                self.viewModel.selectedProduct = product.ident
                            }

                    }
                    }
                }
                .navigationBarTitle(self.searchText)
                .onAppear {
                    self.viewModel.selectedProduct = nil

                    if self.viewModel.isNewLoading && self.viewModel.oldSearchText != self.searchText {
                        self.viewModel.arrayPorducts.removeAll()
                        self.viewModel.oldSearchText = self.searchText
                        self.presenter.search(searchText: self.searchText)
                        self.viewModel.isNewLoading = false
                    }
                }
                .alert(isPresented: self.$viewModel.showAlertView) {
                    Alert(title: Text(self.viewModel.titleAlert),
                          message: Text(self.viewModel.messageAlert),
                          dismissButton: .default(Text("button_alert_search_view".localized), action: {
                            self.presentationMode.wrappedValue.dismiss()
                          }))
                }
                .opacity(self.viewModel.arrayPorducts.isEmpty ? 0.0 : 1.0)
                .onDisappear {
                    self.presenter.stopMonitoring()
                }
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .opacity(self.viewModel.arrayPorducts.isEmpty ? 1.0 : 0.0)
                    .edgesIgnoringSafeArea(.all)
            }.navigationBarHidden(self.isNavigationBarHidden)
        }
    }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView(searchText: "cama",
                     isNavigationBarHidden: .constant(false), viewModel: SearchViewModel())
        }
    }
}
