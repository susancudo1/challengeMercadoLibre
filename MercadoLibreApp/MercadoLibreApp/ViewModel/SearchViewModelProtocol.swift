//
//  SearchViewModelProtocol.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 18/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import CoreGraphics

protocol SearchViewModelProtocol {
    var searchText: String { get set }
    var action: Int? { get set }
    var heightKeyboard: CGFloat { get set }
    var showingAlert: Bool { get set }
    var isNavigationBarHidden: Bool { get set }
    var titleAlert: String { get set }
    var messageAlert: String { get set }
    var showAlertView: Bool { get set }
    var arrayPorducts: [Product] { get set }
    var selectedProduct: Product? { get set }
    var showModalView: Bool { get set }
}
