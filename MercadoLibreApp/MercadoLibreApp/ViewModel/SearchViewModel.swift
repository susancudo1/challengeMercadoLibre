//
//  SearchViewModel.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 18/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation

import SwiftUI

class SearchViewModel: ObservableObject, SearchViewModelProtocol {
    @Published var searchText: String = ""
    @Published var action: Int?
    @Published var heightKeyboard: CGFloat = 0.0
    @Published var showingAlert: Bool = false
    @Published var isNavigationBarHidden: Bool = true
    @Published var titleAlert: String = ""
    @Published var messageAlert: String = ""
    @Published var showAlertView: Bool = false
    @Published var arrayPorducts: [Product] = []
    @Published var selectedProduct: Product?
    @Published var showModalView: Bool = false
}
