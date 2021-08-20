//
//  SearchPresenterFactory.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 18/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation
class SearchPresenterFactory {
    private let viewModel: SearchViewModelProtocol

    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
    }

    func createPresenter() -> SearchPresenter {
        return SearchPresenter(viewModel: self.viewModel)
    }
}
