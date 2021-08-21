//
//  ListPresenter.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 19/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation

class ListPresenter {
    var viewModel: SearchViewModelProtocol
    let productSearchUseCase: ProductSearchUseCaseProtocol
    let checkInternet: CheckInternet

    init(viewModel: SearchViewModelProtocol,
         productSearchUseCase: ProductSearchUseCaseProtocol) {
        self.viewModel = viewModel
        self.productSearchUseCase = productSearchUseCase
        self.checkInternet = CheckInternet()
    }

    func search(searchText: String) {
        // Validacion de conexion a internet
        self.startMonitoring { isConnected in
            DispatchQueue.main.async {
                if isConnected {
                    // Inicia la busqueda
                    self.productSearchUseCase.search(searchText: searchText) { products in
                        if products == nil {
                            self.viewModel.titleAlert = "title_alert_no_coincidences_list_view".localized
                            self.viewModel.messageAlert = "message_alert_no_coincidences_list_view".localized
                            self.viewModel.showAlertView.toggle()
                        } else {
                            self.viewModel.arrayPorducts = products!
                        }
                    }
                } else {
                    self.viewModel.titleAlert = "title_alert_error_network_list_view".localized
                    self.viewModel.messageAlert = "message_alert_error_network_list_view".localized
                    self.viewModel.showAlertView.toggle()
                }
            }
        }

    }

    func startMonitoring(completion: @escaping (Bool) -> Void) {
        // Validacion de conexion a internet
        self.checkInternet.startMonitoring { isConnected in
            if isConnected {
                completion(true)
            } else {
                completion(false)
            }

        }
    }

    func stopMonitoring() {
        self.checkInternet.stopMonitoring()
    }
}
