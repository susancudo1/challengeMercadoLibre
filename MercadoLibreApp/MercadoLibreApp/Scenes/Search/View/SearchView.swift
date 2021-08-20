//
//  ContentView.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject private var viewModel: SearchViewModel
    private var presenter: SearchPresenter

    init() {
        let viewModel = SearchViewModel()
        self.viewModel = viewModel
        self.presenter = SearchPresenterFactory(viewModel: viewModel).createPresenter()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    Spacer()
                    Image(uiImage: #imageLiteral(resourceName: "logoMercadoLibre"))
                        .padding(.vertical)
                    
                    TextField("placeholder_search_view".localized,
                              text: self.$viewModel.searchText)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    
                    NavigationLink(destination: ListView(searchText: self.viewModel.searchText,
                                                         isNavigationBarHidden: self.$viewModel.isNavigationBarHidden, viewModel: self.viewModel),
                                   tag: 1,
                                   selection: self.$viewModel.action) {
                        EmptyView()
                    }
                    Button(action: {
                        self.presenter.search()
                    }) {
                        Text("search_button_search_view".localized)
                            .foregroundColor(Color(UIColor.black))
                            .padding()
                            .background(Color(UIColor.systemYellow))
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .alert(isPresented: self.$viewModel.showingAlert, content: {
                    Alert(title: Text("title_alert_search_view".localized), message: Text("message_alert_search_view".localized), dismissButton: .default(Text("button_alert_search_view".localized)))
                })
                .padding()
            }
            .padding(.bottom, self.viewModel.heightKeyboard)
            .animation(.spring())
            .onAppear{
                self.presenter.hideNavigationBar()
                self.presenter.manageKeyboard()
            }
            .navigationBarHidden(self.viewModel.isNavigationBarHidden)
            .navigationBarTitle(Text(""))
            .edgesIgnoringSafeArea(.all)
        }.environment(\.horizontalSizeClass, .compact)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
