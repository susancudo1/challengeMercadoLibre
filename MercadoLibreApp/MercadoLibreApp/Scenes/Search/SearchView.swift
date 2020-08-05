//
//  ContentView.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    @State private var action: Int? = 0
    @State private var heightKeyboard: CGFloat = 0.0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    Image("logoMercadoLibre")
                        .padding(.vertical)
                    
                    TextField("Buscar en mercadolibre", text: $searchText)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    
                    NavigationLink(destination: ListView(searchText: searchText), tag: 1, selection: $action) {
                        EmptyView()
                    }
                    Button(action: {
                        self.action = 1
                    }) {
                        Text("Buscar")
                            .foregroundColor(Color(UIColor.systemGray5))
                            .padding()
                            .background(Color(UIColor.systemYellow))
                            .cornerRadius(10)
                    }
                    .disabled(searchText.count > 0 ? false : true)
                    
                    Spacer()
                }
                .padding()
            }
            .padding(.bottom, heightKeyboard)
            .animation(.spring())
            .onAppear{
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                    let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    let height = value.height
                    self.heightKeyboard = height
                }
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                    self.heightKeyboard = 0
                }
            }
        }.environment(\.horizontalSizeClass, .compact)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
