//
//  ProductSearchUseCase.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 19/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation

class ProductSearchUseCase: ProductSearchUseCaseProtocol {
    let mercadoLibreWorker: MercadoLibreWorker
    let downloadImageWorker: DownloadImageWorker

    init() {
        let mercadoLibreWorker = MercadoLibreWorker()
        let downloadImageWorker = DownloadImageWorker()
        self.mercadoLibreWorker = mercadoLibreWorker
        self.downloadImageWorker = downloadImageWorker
    }

    func search(searchText: String, completion: @escaping ([Product]?) -> Void) {
        //Busca el producto en el servicio expuesto en mercado libre
        self.mercadoLibreWorker.getSearch(searchText: searchText) { (success, products) in
            if success {

                guard products!.count > 0 else {
                    completion(nil)
                    return
                }
                if var newProducts = products {
                    //Por cada producto encontrado se busca su imagen
                    for index in 0...newProducts.count - 1 {
                        self.downloadImageWorker.getImage(newProducts[index]) { (success, imageData) in
                            if success {
                                newProducts[index].imageData = imageData

                            }
                            completion(newProducts)
                        }
                    }

                }
            } else {
                completion(products)
            }
        }
    }
}
