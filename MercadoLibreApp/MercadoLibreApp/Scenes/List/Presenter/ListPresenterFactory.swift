//
//  ListPresenterFactory.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 19/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation

class ListPresenterFactory {
    private let viewModel: SearchViewModelProtocol

    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
    }

    func createPresenter() -> ListPresenter {
        return ListPresenter(viewModel: self.viewModel,
                             productSearchUseCase: ProductSearchUseCase(mercadoLibreWorker: MercadoLibreWorker(),
                                                                        downloadImageWorker: DownloadImageWorker()))
    }
}
