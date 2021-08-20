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
    @State private var isNewLoading = true

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
                List(self.viewModel.arrayPorducts, id: \.id) { product in
                    NavigationLink(destination: DetailsView(product: product,
                                                            isNavigationBarHidden: self.$isNavigationBarHidden)) {
                        CellView(product: product)
                            .buttonStyle(PlainButtonStyle())
                    }
                }
                .navigationBarTitle(self.searchText, displayMode: .inline)
                .onAppear {
                    self.isNavigationBarHidden = false
                    if isNewLoading {
                    self.presenter.search(searchText: self.searchText)
                        self.isNewLoading = false
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

                LoadingView()
                    .opacity(self.viewModel.arrayPorducts.isEmpty ? 1.0 : 0.0)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView(searchText: "cama",
                     isNavigationBarHidden: .constant(false), viewModel: SearchViewModel())
        }
    }
}
