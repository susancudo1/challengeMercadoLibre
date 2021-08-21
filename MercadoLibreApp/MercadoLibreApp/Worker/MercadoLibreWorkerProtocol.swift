//
//  MercadoLibreWorkerProtocol.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 19/08/21.
//  Copyright © 2021 Javier Susa. All rights reserved.
//

import Foundation

protocol MercadoLibreWorkerProtocol {
    func getSearch(searchText: String, completion: @escaping (Bool, [Product]?) -> Void)
}
