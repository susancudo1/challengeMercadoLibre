//
//  DownloadImageWorkerProtocol.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 19/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation

protocol DownloadImageWorkerProtocol {
    func getImage(_ product: Product, completion: @escaping (Bool, Data?) -> Void)
}
